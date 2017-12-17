#' Maps a date to an academic year.
#'
#' @param x A date to map to an acedemic year.
#'
#' @return An academic year as a charachter. Academic years run from August 1st to July 31st.
#'
#' @examples
#' academic_year(as.Date('2017-07-31'))
#' academic_year(as.Date('2017-08-01'))
#' @export

academic_year <- function(x) {
  if (any(!is.na(x) & !lubridate::is.Date(x))) stop("x is not a date.", call. = FALSE)

  ifelse(lubridate::month(x) < 8,
         paste0(lubridate::year(x) - 1, '/', stringr::str_sub(lubridate::year(x), 3, 4)),
         paste0(lubridate::year(x), '/', stringr::str_sub(lubridate::year(x) + 1, 3, 4)))

}
