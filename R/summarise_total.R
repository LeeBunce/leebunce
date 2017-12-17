#' Summarise with totals
#'
#' A version of dplyr's summarise function that provides an additional total row.
#'
#' @param df A grouped date.frame.
#' @param label The label to use in the grouping columns of the 'Total' row. Defaults to 'Total'.
#' @param ... Name-value pairs of summary functions, as for dplyr:summarise. The name will be the name of the variable in the result. The value should be an expression that returns a single value like min(x), n(), or sum(is.na(y)).
#'
#' @return A data.frame containing a row of summary statistics for each group, plus a 'Total' row.
#'
#' @examples
#' iris %>% group_by(Species) %>% summarise(n = n(), `Mean Sepal Length` = mean(Sepal.Length))
#' iris %>% group_by(Species) %>% summarise_total(n = n(), `Mean Sepal Length` = mean(Sepal.Length))
#'
#' @seealso summarise
#'
#' @export

summarise_total <- function(df, label = "Total", ...) {
  if (!('grouped_df' %in% class(df))){
    stop("df is not a grouped date.frame.", call. = FALSE)
  }

  # Summarise grouped df and convert grouping variables to charachter vectors
  grouped_summary <- dplyr::summarise(df, ...) %>%
    ungroup() %>%
    mutate_at(group_vars(df), as.character)

  # Summarise ungrouped df and add additional columns
  ungrouped_summary <- dplyr::summarise(ungroup(df), ...)

  for (i in group_vars(df)){
    ungrouped_summary <- dplyr::mutate(ungrouped_summary, !!i := label)
  }

  # Bind grouped and ungrouped summaries
  dplyr::bind_rows(grouped_summary, ungrouped_summary)

}
