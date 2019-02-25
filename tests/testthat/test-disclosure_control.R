context("disclosure_control")

test_that("disclosure_control gives the right value.", {
  expect_equal(disclosure_control(0:5), c("0", "<4", "<4", "<4", "5", "5"))
  expect_error(is.na(disclosure_control(NA)))
})

test_that("round_n handles data frames.", {
  expect_equal(class(disclosure_control(iris)),  'data.frame')
  expect_equal(disclosure_control(iris)[1, 2], "<4")
})
