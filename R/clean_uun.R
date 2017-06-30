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
#' @export

clean_uun <- function(uun_list){
     for (i in seq_along(uun_list)){

          if (grepl("^[0-9]{7,}$", uun_list[i])) {
               uun_list[i] <- paste("S", uun_list[i], sep = "")
          }

          if (grepl("^s[0-9]{7,}$", uun_list[i])) {
               uun_list[i] <- toupper(uun_list[i])
          }
     }

     uun_list
}

