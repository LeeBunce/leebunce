#' Convert a proportion to a percentage.
#'
#' @param x A value to convert to a percentage.
#' @param digits The number of decimal places to round to, passed to the round function.
#'
#' @return percent simply takes a proprtion and converts to a percentage by multiplying by 100 and rounding.
#'
#' @examples
#' percent(0.43569)
#' percent(0.43569, digits = 2)
#' @export

percent <- function(x, digits = 1){
  round(x*100, digits = digits)
}
