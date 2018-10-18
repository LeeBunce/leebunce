#' Maps a date to a non-calendar year.
#'
#' @param x A date to map to an non-calendar year.
#'
#' @return An non-calendar year as a charachter.
#'
#' @note Academic years run from August 1st to July 31st.
#'  Financial years run from April 1st to March 31st.
#'
#' @examples
#' academic_year(as.Date('2017-07-31'))
#' academic_year(as.Date('2017-08-01'))
#'
#' financial_year(as.Date('2017-03-31'))
#' financial_year(as.Date('2017-04-01'))
#'
#' @name non-calendar
NULL

#' @rdname non-calendar
#' @export

academic_year <- function(x) {
  if (any(!is.na(x) & !lubridate::is.Date(x))) stop("x is not a date.", call. = FALSE)

  ifelse(lubridate::month(x) < 8,
         paste0(lubridate::year(x) - 1, '/', stringr::str_sub(lubridate::year(x), 3, 4)),
         paste0(lubridate::year(x), '/', stringr::str_sub(lubridate::year(x) + 1, 3, 4)))

}

#' @rdname non-calendar
#' @export

financial_year <- function(x) {
  if (any(!is.na(x) & !lubridate::is.Date(x))) stop("x is not a date.", call. = FALSE)

  ifelse(lubridate::month(x) < 4,
         paste0(lubridate::year(x) - 1, '/', stringr::str_sub(lubridate::year(x), 3, 4)),
         paste0(lubridate::year(x), '/', stringr::str_sub(lubridate::year(x) + 1, 3, 4)))

}
