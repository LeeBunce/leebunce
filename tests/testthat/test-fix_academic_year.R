context("fix_academic_year")

test_that("fix_academic_year gives the correct value", {
  expect_equal(fix_academic_year('2014/5'), '2014/15')
  expect_equal(fix_academic_year(c('2014/5', '2015/6')), c('2014/15', '2015/16'))
  expect_error(fix_academic_year('2014/65'))
})

test_that("fix_academic_year handles NA correctly", {
  expect_equal(is.na(fix_academic_year(NA)), TRUE)
  expect_equal(fix_academic_year(c('2014/5', NA)), c('2014/15', NA))
})
