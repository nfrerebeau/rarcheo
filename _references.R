# Créer automatiquement une bibliographie des packages R utilisés
dep <- desc::desc_get_deps()$package[-1] # Retirer R base
knitr::write_bib(c(.packages(), dep), file = "packages.bib", prefix = "R-")
