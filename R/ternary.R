# Calcul des coordonnées ternaires
ternary_coordinates <- function(x) {
  # Validation
  if(is.null(dim(x)) | ncol(x) != 3) {
    stop("Le tableau de données doit avoir trois colonnes.", call. = FALSE)
  }
  if(any(x < 0)) {
    stop("Des valeurs positives sont attendues.", call. = FALSE)
  }
  # Calcul des coordonnées
  x <- x / rowSums(x)
  data.frame(
    x = x[, 2] + x[, 3] / 2,
    y = x[, 3] * sqrt(3) / 2
  )
}

ternary_triangle <- function(total = 100,  grid = TRUE, labels = c("X","Y","Z"),
                             col.triangle = "black", col.grid = "grey",
                             lty.triangle = 1, lty.grid = 2,
                             lwd.triangle = 1, lwd.grid = 2,
                             cex = 1, cex.axis = 1, cex.lab = 1.2, ...) {
  
  # Tracer le triangle
  top <- sqrt(3) / 2
  adj <- 0.01
  
  par(mar = c(1, 1, 1, 1) + 0.1, las = 1, cex = cex, cex.axis = cex.axis, 
      cex.lab = cex.lab, ...)
  plot(
    x = NULL,
    y = NULL,
    xlim = c(-0.05, 1.05),
    ylim = c(-0.05, 1.05),
    xlab = "", 
    ylab = "", 
    axes = FALSE,
    asp = 1
  )
  polygon(
    x = c(0, 0.5, 1),
    y = c(0, top, 0), 
    border = col.triangle, 
    lty = lty.triangle,
    lwd = lwd.triangle
  )
  
  # Tracer la grille
  if(grid) {
    for(i in 1:4 * 0.2) {
      lines(x = c(1 - i, (1 - i) / 2), y = c(0, 1 - i) * top, 
            lty = lty.grid, lwd = lwd.grid, col = col.grid)
      lines(x = c(1 - i, 1 - i + i / 2), y = c(0, i) * top, 
            lty = lty.grid, lwd = lwd.grid, col = col.grid)
      lines(x = c(i / 2, 1 - i + i / 2), y = c(i, i) * top, 
            lty = lty.grid, lwd = lwd.grid, col = col.grid)
      
      text(x = (1 - i) / 2 - 6 * adj, y = (1 - i) * top, 
           label = (1 - i) * total, srt = 0, cex = cex.axis, col = col.grid)
      text(x = 1 - (1 - i) / 2 + 3* adj, y = (1 - i) * top + 5 * adj, 
           label = i * total, srt = 240, cex = cex.axis, col = col.grid)
      text(x = i + adj, y = - 0.05, label = (1 - i) * total, 
           srt = 120, cex = cex.axis, col = col.grid)
    }
  }
  
  # Afficher les labels aux sommets
  if(!is.null(labels)) {
    text(
      x = c(0, 1, 0.5),
      y = c(-0.03, -0.03, sqrt(3) / 2 + 0.03),
      label = labels,
      cex = cex.lab
    )
  }
}

ternary <- function(x, parts = c(1, 2, 3), total = 100,
                    ellipse.conf = FALSE, ellipse.prob = FALSE, 
                    level = 0.95, labels = colnames(x)[parts],
                    center = FALSE, scale = FALSE, grid = !center & !scale, 
                    draw = TRUE, habillage = NULL, legend = TRUE,
                    pch = c(0:20), col = "steelblue",
                    col.triangle = "black", col.grid = "grey",
                    lty.ellipse.conf = 1, lwd.ellipse.conf = 1, 
                    lty.ellipse.prob = 2, lwd.ellipse.prob = 1, 
                    lty.triangle = 1, lwd.triangle = 1, 
                    lty.grid = 2, lwd.grid = 1,
                    cex = 1, cex.axis = 1, cex.lab = 1, add = FALSE, ...) {
  
  # Préserver les paramètres graphiques
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE)
  
  # Tracer le triangle
  if(!add) {
    ternary_triangle(total = total, grid = grid, labels = labels,
                     col.triangle = col.triangle, col.grid = col.grid,
                     lty.triangle = lty.triangle, lty.grid = lty.grid,
                     lwd.triangle = lwd.triangle, lwd.grid = lwd.grid,
                     cex = cex, cex.axis = cex.axis, cex.lab = cex.lab, ...)
  }
  
  # Sélectionner les données
  data <- x[, parts]
  data <- data / rowSums(data)
  # TODO: centrage et réduction
  # Coordonnées ternaires
  coord <- ternary_coordinates(data)
  
  # Habillage en fonction de la variable illustrative
  if (is.null(habillage)) { 
    habillage <- rep("none", length.out = nrow(x))
  } else if (length(habillage) == 1) { 
    habillage <- x[[habillage]]
  } else if (length(habillage) != nrow(x)) {
    stop("", call. = FALSE)
  }
  habillage <- factor(habillage, levels = unique(habillage))
  nfactor <- nlevels(habillage)
  
  if (length(col) < nfactor) { 
    col <- c(col, rep(col, ceiling((nfactor - length(col)) / length(col))))
  }
  if (length(pch) < nfactor) {
    pch <- c(pch, rep(pch, ceiling((nfactor - length(pch)) / length(col))))
  }
  
  if (legend & nfactor > 1) {
    legend("topleft", legend = levels(habillage), col = col, pch = pch, 
           bty = "n", cex = cex - 0.3)
  }
  
  # Projeter les données
  if (draw) {
    lines(x = coord$x, y = coord$y, type = "p", 
          pch = pch[habillage], col = col[habillage], cex = cex)
  }
  
  # Tracer les ellipses
  ellipse <- split(x = data, f = habillage)
  for(i in seq_along(ellipse)) {
    data_ellipse <- ellipse[[i]]
    ncol <- ncol(data_ellipse)
    nrow <- nrow(data_ellipse)
    if (nrow > 2 & !anyNA(data_ellipse)) {
      # Degrés de liberté
      df1 <- ncol - 1
      df2 <- nrow - ncol + 1
      # Ellipse de confiance
      if (ellipse.conf) {
        rconf <- sqrt(qf(p = level, df1, df2) * df1 / df2)
        # ellipses(mean(data_ellipse), var(data_ellipse), r = rconf, 
        #          col = col[i], lty = lty.ellipse.conf, lwd = lwd.ellipse.conf)
      }
      # Ellipse de probabilité
      if (ellipse.prob) {
        rprob <- sqrt(qchisq(p = level, df = df1))
        # ellipses(mean(data_ellipse), var(data_ellipse), r = rprob, 
        #          col = col[i], lty = lty.ellipse.prob, lwd = lwd.ellipse.prob)
      }
    }
  }
}
