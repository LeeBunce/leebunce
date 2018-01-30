#' Converts academic year into the correct format
#'
#' @param x A vector of academic years in 'yyyy/y' format.
#'
#' @return A vector of academic year's in the corrected 'yyyy/yy' format.
#'
#' @examples
#' fix_academic_year('2014/5')
#' fix_academic_year(c('2014/5', '1999/0'))
#' fix_academic_year('2014/65')
#' @export

# Converts academic year in form '2014/5' to '2014/15'.

fix_academic_year <- function(x){

     if(any(!is.na(x) & !stringr::str_detect(x, '^[0-9]{4}/[0-9]$'))){
          stop('Some values are not in the format yyyy/y')
     }

     #year <- stringr::str_sub(x, 1, 4) %>% as.numeric()

     year <- as.numeric(stringr::str_sub(x, 1, 4))

     subsequent <- year + 1

     dplyr::case_when(
       is.na(x) ~ NA_character_,
       TRUE ~ paste0(year, '/', stringr::str_sub(subsequent, 3, 4))
     )

}
