#' Apply homelessness disclosure control
#'
#' This function applies the standard method of disclosure control used in homelessness. If x is a data.frame then rounding is applied to all numeric variables.
#'
#' @param x A numeric vector or a data.frame.
#'
#' @return A numeric vector or a data.frame.
#'
#' @examples
#' disclosure_control(0:10)
#' disclosure_control(iris)
#' @name disclosure_control

NULL

#' @rdname disclosure_control
#' @export

disclosure_control <- function(x) UseMethod("disclosure_control")

disclosure_control.numeric <- function(x) {

  dplyr::case_when(
    is.na(x) ~ NA_character_,
    x == 0 ~ "0",
    x < 4 ~ "<4",
    TRUE ~ as.character(round_5(x))
  )

}

disclosure_control.data.frame <- function(x){
  dplyr::mutate_if(x, is.numeric, disclosure_control.numeric)
}
