#' Calculate a proportion from a vector
#'
#' @param x A vector to calculate a proportion from.
#' @param numerator A vector of elements to count in the numerator.
#' @param denominator A vector of elements to count in the denominator.
#'
#' @return The proportion of
#'
#' @example
#' lb_prop(x = c(T, T, T, T, F, NA), numerator = T, denominator = c(T, F))

lb_prop <- function(x, numerator, denominator, percent = TRUE, digits = 1){

  n <- sum(x %in% numerator)
  d <- sum(x %in% denominator)

  prop <- n/d

  if(percent == TRUE){
    prop <- round(prop*100, digits)
  }

  prop
}
