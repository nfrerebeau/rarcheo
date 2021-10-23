# options set globally
set.seed(12345)

# chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = TRUE,
  dpi = 300,
  out.width = "70%",
  fig.align = "center",
  fig.width = 6
)

# latex options set globally
if (knitr::is_latex_output()) {
  knitr::opts_chunk$set(width = 69)
  options(width = 69)
  options(crayon.enabled = FALSE)
  options(cli.unicode = TRUE)
}
