#' Produces a 'clean' uun.
#'
#' This function converts UUN's to a clean format. This is a string beginning with an upper case 'S' and followed by 7 digits.
#'
#' @param x A vector of uun's to be cleaned.
#'
#' @return A vector of clean uun's.
#'
#' @examples
#' clean_uun('s1234567')
#' clean_uun(1234567)
#' @export

clean_uun <- function(x) {
  if (any(!grepl("^[0-9]{7}$", x) & !grepl("^s[0-9]{7}$", x) & !grepl("^S[0-9]{7}$", x) & !is.na(x))) {
    warning('Some values do not match expected UUN format')
  }

  clean <- ifelse(grepl("^[0-9]{7}$", x),
                  paste0("S", x),
                  ifelse(grepl("^s[0-9]{7}$", x), toupper(x),
                         x))
  clean

}
