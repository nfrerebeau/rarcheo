# options set globally
Sys.setenv(LANGUAGE = "fr")
options(width = 69)
set.seed(12345)

# chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = TRUE,
  dpi = 300,
  out.width = "100%",
  fig.align = "center",
  fig.width = 6,
  width = 69
)

# latex options set globally
if (knitr::is_latex_output()) {
  options(crayon.enabled = FALSE)
  options(cli.unicode = TRUE)
}

# load packages
library(ggplot2)
old <- theme_set(theme_bw())
