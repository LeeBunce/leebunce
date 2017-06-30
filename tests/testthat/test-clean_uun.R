context("clean_uun")

test_that("clean_uun gives the right value.", {
  expect_equal(clean_uun('s1234567'), 'S1234567')
  expect_equal(clean_uun(c('s1234567', 's1234567')), c('S1234567', 'S1234567'))
  expect_equal(clean_uun(NA), NA)
})
