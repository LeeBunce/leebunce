#' Calculate a proportion or a ratio from a vector.
#'
#' @param x A vector to calculate a proportion or ratio from.
#' @param numerator A vector of elements to count in the numerator.
#' @param denominator For lb_prop this is a vector of elements to count in the denominator in addition to those included in the numerator. For lb_ratio the values given by the numerator argument are not added.
#' @param percect A logical indicating whether to present the output as a percentage rather than a proportion..
#' @param round A logical indicating whether to round the output.
#' @param digits The number of decimal places to round to, passed to the round function.
#'
#' @return prop returns the proportion of specified values, presented as a percentage or raw proportion.
#'
#' ratio returns a ratio.
#'
#' @examples
#' example <- c(T, T, T, T, T, F, F, F, NA)
#' prop(x = example, numerator = T, denominator = F)
#' prop(x = example, numerator = T, denominator = F, percent = FALSE, digits = 3)
#'
#' ratio(example, T, F)
#' ratio(example, T, F, round = TRUE)
#' @export

prop <- function(x, numerator, denominator, percent = TRUE, round = TRUE, digits = 1){

  n <- sum(x %in% numerator)
  d <- sum(x %in% c(numerator, denominator))

  prop <- n/d

  if(percent == TRUE){
    prop <- prop*100
  }

  if(round == TRUE){
    prop <- round(prop, digits = digits)
  }

  prop
}

#' @rdname prop
#' @export

ratio <- function(x, numerator, denominator, round = FALSE,  digits = 1){

  n <- sum(x %in% numerator)
  d <- sum(x %in% denominator)

  ratio <- n/d

  if(round == TRUE){
    ratio <- round(ratio, digits)
  }

  ratio
}
