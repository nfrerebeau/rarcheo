# Créer automatiquement une bibliographie des packages R utilisés
dep <- desc::desc_get_deps()$package[-1] # Retirer R base
pkg <- c(.packages(), dep)

## Créer automatiquement une bibliographie des packages
cite <- lapply(
  X = pkg,
  FUN = function(x) {
    bib <- try(citation(x), silent = FALSE)
    if (inherits(bib, "try-error")) return(NULL)
    
    if (length(bib) > 1) {
      tmp <- unclass(bib)
      att <- vapply(X = tmp, FUN = attr, FUN.VALUE = character(1), which = "bibtype")
      keep <- which(att == "Manual")
      if (length(keep) == 0) keep <- 1
      bib <- bib[keep]
    }
    
    entry <- utils::toBibtex(bib)
    
    entry[1] <- sub("\\{,$", sprintf("{R-%s,", x), entry[1])
    entry
  }
)
cat(unlist(cite), file = "packages.bib", sep = "\n")
