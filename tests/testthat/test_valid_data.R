test_that(desc = "Test the structure", {

  expect_equal(base::ncol(timeSeriesIndia) == 7, TRUE)
  expect_equal(base::ncol(stateWise) == 11, TRUE)
  # expect_equal(base::ncol(italy_province) == 11, TRUE)

  expect_equal(base::nrow(timeSeriesIndia) >= 175, TRUE)
  expect_equal(base::nrow(stateWise) == 38, TRUE)
  # expect_equal(base::nrow(italy_province) >= 18000, TRUE)

})
