#' Maps a date to an academic year.
#'
#' @param x A date to map to an acedemic year.
#'
#' @return An academic year as a charachter.
#'
#' @examples
#' academic_year(as.Date('2017-07-31'))
#' academic_year(as.Date('2017-08-01'))

academic_year <- function(x) {
  if (lubridate::is.Date(x) == FALSE)
    stop("x is not a date.", call. = FALSE)

  academic_year <- ifelse(month(x) < 8,
                          paste0(year(x) - 1, '/', str_sub(year(x), 3, 4)),
                          paste0(year(x), '/', str_sub(year(x) + 1, 3, 4)))

  academic_year
}
