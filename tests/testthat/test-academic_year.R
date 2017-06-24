context("Academic year")

test_that("Academic year gives the corret year", {
  expect_equal(academic_year(as.Date('2017-07-31')), '2016/17')
  expect_equal(academic_year(as.Date('2017-08-01')), '2017/18')
  expect_equal(academic_year(c(as.Date('2017-07-31'), as.Date('2017-08-01'))), c('2016/17', '2017/18'))
})
