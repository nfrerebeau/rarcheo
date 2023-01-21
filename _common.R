## Options set globally
Sys.setenv(LANGUAGE = "fr")
options(width = 68)
set.seed(12345)

## Load packages
if (requireNamespace("ggplot2", quietly = TRUE)) {
  library(ggplot2)
  old <- theme_set(theme_bw())
}
