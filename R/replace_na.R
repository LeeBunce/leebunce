#' Replace NA values with a string.
#'
#' @param x A vector.
#'
#' @param string A string
#'
#' @return A character vector.
#'
#' @examples
#' replace_na(NA, 'Missing')
#' @export

replace_na <- function(x, string) {
  ifelse(is.na(x), string, x)
}
