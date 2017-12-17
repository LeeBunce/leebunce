context("summarise_total")

test_that("Error returned for ungrouped df", {
  expect_error(summarise_total(iris))
})

test_that('Correct value is calculated', {
  iris_summarised <- iris %>%
    group_by(Species) %>%
    summarise_total(n = n(), `Mean Sepal Length` = mean(Sepal.Length))

  expect_equal(iris_summarised[[4, 3]], mean(iris$Sepal.Length))
})

test_that('Total row is correctly labelled', {
  iris_grouped <- iris %>% group_by(Species)
  total <- summarise_total(iris_grouped, n = n(), `Mean Sepal Length` = mean(Sepal.Length))
  overall <- summarise_total(iris_grouped, n = n(), label = 'Overall')

  expect_equal(total[[4, 1]], 'Total')
  expect_equal(overall[[4, 1]], 'Overall')
})

test_that('Class of grouping variable columns in output is character', {
  iris_summarised <- iris %>%
    group_by(Species) %>%
    summarise_total(n = n(), `Mean Sepal Length` = mean(Sepal.Length))

  expect_true(is.character(iris_summarised$Species))
})
