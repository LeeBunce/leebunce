#' Replace NA values with a string.
#'
#' While it is more common to replace strings with NA for analysis it is sometimes nice to make the opposite change for presentation purposes.
#'
#' @param x A vector.
#'
#' @param string A string.
#'
#' @return A character vector.
#'
#' @examples
#' replace_na(NA, 'Missing')
#' @export

replace_na <- function(x, string) {
  ifelse(is.na(x), string, x)
}
