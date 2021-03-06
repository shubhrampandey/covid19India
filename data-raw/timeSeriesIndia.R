## code to prepare `timeSeriesIndia` dataset goes here

#' @title Update daily data in time series format
#' @description This function updates data in a time series format
#' @param branch default branch is master
#' @author Shubhram Pandey
#' @import dplyr usethis utils rlang
updateTimeSeriesIndia <- function(branch = "master"){
  library(dplyr)
  print(paste0("Branch name:",branch))

  if (branch != "master") {
    stop("The branch argument is missing")
  }
  "." = NULL
  timeSeriesIndiaOld = covid19India::timeSeriesIndia
  timeSeriesIndia <- read.csv("https://api.covid19india.org/csv/latest/case_time_series.csv",
                              stringsAsFactors = FALSE) %>%
    select(-c("Date")) %>%
    mutate(Date = seq(as.Date("2020-01-30"),as.Date("2020-01-30") + (nrow(.) - 1),by = 1)) %>%
    select("Date",dplyr::everything())
  if (ncol(timeSeriesIndia) != 7) {
    stop("The number of columns is invalid")
  }
  if (timeSeriesIndia$Daily.Confirmed[base::nrow(timeSeriesIndia)] != timeSeriesIndiaOld$Daily.Confirmed[base::nrow(timeSeriesIndiaOld)]) {
    print("Updates available")
    # covid19India::timeSeriesIndia = timeSeriesIndia
    usethis::use_data(timeSeriesIndia, overwrite = TRUE)
    save(timeSeriesIndia, file = "data/timeSeriesIndia.Rda")
    write.csv(timeSeriesIndia, "csv/timeSeriesIndia.csv", row.names = FALSE)
    print("The time series dataset was updated")
  } else {
    print("Updates are not available")
  }
  return(print("Done..."))
}
