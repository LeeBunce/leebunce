#' Round to a specified integer
#'
#' This function rounds a number to a specified integer. If x is a data.frame then rounding is applied to all numeric variables.
#' The function round_5 gives a particularly common use case, as published data is often rounded to the nearest 5 for disclodure control.
#'
#' @param x A numeric vector or a data.frame.
#'
#' @param n An integer to round to.
#'
#' @return A numeric vector or a data.frame.
#'
#' @examples
#' round_n(16, 5)
#' round_n(c(7, 16, NA), 5)
#' round_n(iris, 5)
#' round_5(iris)
#' @name round_n
NULL

#' @rdname round_n
#' @export

round_n <- function(x, n) UseMethod("round_n")

round_n.numeric <- function(x, n) {
  if (!(n - round(n) == 0) | n <= 0) stop('n must be a positive whole number')

  n*round(x/n)

}

round_n.data.frame <- function(x, n){
  dplyr::mutate_if(x, is.numeric, round_n.numeric, n = n)
}

#' @rdname round_n
#' @export

round_5 <- function(x){
  round_n(x, n = 5)
}
