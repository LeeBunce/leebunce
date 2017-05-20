#' Open multiple sheets from an excel workbook
#'
#' @param x An excel workbook.
#'

lb_read_excel_sheets <- function(x){
  sheets <- readxl::excel_sheets(x)
}
