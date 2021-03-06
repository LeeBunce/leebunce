#' Read multiple sheets from an excel workbook
#'
#' The motivation behind this function is cases where an excel workbook contains a number of sheets in the same format, where each sheet in effect represents a variable.
#'
#' @param x An excel workbook.
#' @param ignore A vector of sheet names to ignore.
#' @param bind If TRUE then return a single data frame with id column 'Sheet'. Otherwise returns a list of data frames.
#' @param ... Additional arguments to be passed to read_excel.
#'
#' @return Reads all sheets from an excel file into R as a single data frame, or if bind = FALSE a list of data frames.
#'
#' @examples
#' # Download Guardian university league table spreadsheet and save to desktop.
#' # https://docs.google.com/spreadsheets/d/1P1AiFGB5UFO0v26Ufe_3YNOT4lISK6DAaC8dvDRiVzs/edit#gid=1544561606
#'
#' read_excel_sheets(x = "~/Desktop/Guardian University Guide 2018.xlsx",
#'   ignore = c('Institutional', 'Sheet2', 'Sheet3'),
#'   skip = 1,
#'   n_max = 159)
#' @export

read_excel_sheets <- function(x, ignore = NULL, bind = TRUE, ...){
  sheets <- readxl::excel_sheets(x) %>%
    .[!(. %in% ignore)]

  uploads <- purrr::map(sheets, readxl::read_excel,
                 path = x,
                 ...)

  names(uploads) <- sheets

  if(bind == TRUE){
    uploads <- dplyr::bind_rows(uploads, .id = 'Sheet')
  }

  uploads

}
