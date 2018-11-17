context("academic year")

test_that("Academic year gives the correct year", {
  expect_equal(academic_year(as.Date('2017-07-31')), '2016/17')
  expect_equal(academic_year(as.Date('2017-08-01')), '2017/18')
  expect_equal(academic_year(c(as.Date('2017-07-31'), as.Date('2017-08-01'))), c('2016/17', '2017/18'))
})

test_that("NA's are handled properly", {
  expect_equal(academic_year(NA), NA)
  expect_equal(academic_year(c(as.Date('2017-07-31'), NA)), c('2016/17', NA))
})
