#' Round to a specified integer
#'
#' This function rounds a number to a specified integer.
#'
#' @param x A numeric vector.
#'
#' @param n An integer to round to.
#'
#' @return A numeric vector.
#'
#' @examples
#' round_n(16, 5)
#' round_n(c(7, 16, NA), 5)
#' @export

round_n <- function(x, n) {
  if (!(n - round(n) == 0) | n <= 0) stop('n must be a positive whole number')

  n*round(x/n)

}
