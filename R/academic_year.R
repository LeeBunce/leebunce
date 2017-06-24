#' Maps a date to an academic year.
#'
#' @param x A date to map to an acedemic year.
#'
#' @return An academic year as a charachter.
#'
#' @examples
#' academic_year(as.Date('2017-07-31'))
#' academic_year(as.Date('2017-08-01'))

academic_year <- function(date) {
  if (is.Date(date) == FALSE)
    stop("Value is not a date.", call. = FALSE)

  academic_year <- if (month(date) < 8) {
    paste0(year(date) - 1, '/', str_sub(year(date), 3, 4))
  } else {
    paste0(year(date), '/', str_sub(year(date) + 1, 3, 4))
  }

  academic_year
}
