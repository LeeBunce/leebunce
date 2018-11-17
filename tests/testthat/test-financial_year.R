context("financial year")

test_that("Financial year gives the correct year", {
  expect_equal(financial_year(as.Date('2017-03-31')), '2016/17')
  expect_equal(financial_year(as.Date('2017-04-01')), '2017/18')
  expect_equal(financial_year(c(as.Date('2017-03-31'), as.Date('2017-04-01'))), c('2016/17', '2017/18'))
})

test_that("NA's are handled properly", {
  expect_equal(financial_year(NA), NA)
  expect_equal(financial_year(c(as.Date('2017-03-31'), NA)), c('2016/17', NA))
})
