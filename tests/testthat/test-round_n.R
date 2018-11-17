context("round_n")

test_that("round_n gives the right value.", {
  expect_equal(round_n(16, 5), 15)
  expect_equal(round_n(c(7, 16, NA), 5), c(5, 15, NA))
  expect_error(is.na(round_n(NA, 5)))
  expect_error(round_n(16, 5.5))
  expect_error(round_n(16, 0))
  expect_error(round_n(16, -5))
})

test_that("round_n handles data frames.", {
  expect_equal(class(round_n(iris, 5)),  'data.frame')
  expect_equal(round_n(iris, 5)[1, 1], 5)
})

test_that("round_5 works correctly.", {
  expect_equal(round_n(iris, 5), round_5(iris))
  expect_equal(round_n(1:10, 5), round_5(1:10))
})
