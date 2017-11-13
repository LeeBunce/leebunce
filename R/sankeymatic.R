#' Create Sankey charts with sankeymatic.com
#'
#' This function produces a data.frame of text that can be pasted into sankeymatic.com for the creation of sankey charts. It is essentially an unsatisfactory stop gap until some nice way of producing sankey charts in ggplot2 is introduced.
#'
#' @param df A data frame from which to creat the sankey chart.
#'
#' @param left A variable from the data frame that will feature on the left hand side of the sankey chart.
#'
#' @param right A variable from the data frame that will feature on the right hand side of the sankey chart.
#'
#' @return A data.frame with one column, 'sankeymatic', of nodes and counts in the format required by sankeymatic.com.
#'
#' A data.frame is produced rather than a tibble as the print method allows row.names and right align to be suppressed. Text can then be copied directly from the console.
#'
#' @examples
#' library(ggplot2)
#' sankeymatic(diamonds, cut, color)
#' sankeymatic(diamonds, cut, color) %>%  print(right = FALSE, row.names = FALSE)
#' @export
#'
#' @importFrom magrittr "%>%"

sankeymatic <- function(df, left, right) {

  left <- rlang::enquo(left)
  right <- rlang::enquo(right)

  dplyr::count(df, !!left, !!right) %>%
    mutate(sankeymatic = paste0("1.", !!left, " [", n, "] ",  "2.", !!right)) %>%
    select(sankeymatic) %>%
    as.data.frame()

}
