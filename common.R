# options set globally
Sys.setenv(LANGUAGE = "fr")
options(width = 68)
set.seed(12345)

# latex options set globally
if (knitr::is_latex_output()) {
  options(crayon.enabled = FALSE)
  options(cli.unicode = TRUE)
}

# load packages
library(ggplot2)
old <- theme_set(theme_bw())
