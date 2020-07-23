#' @title Update daily data in time series format
#' @description This function updates data in a time series format
#' @param branch default branch is master
#' @examples updateTimeSeriesIndia()
#' @author Shubhram Pandey
#' @export
updateTimeSeriesIndia <- function(branch = "master"){

  `%>%` <- magrittr::`%>%`
  print(paste0("Branch name:",branch))

  if (branch != "master") {
    stop("The branch argument is missing")
  }
  timeSeriesIndia <- read.csv("https://api.covid19india.org/csv/latest/case_time_series.csv",
                         stringsAsFactors = FALSE)
  if (ncol(timeSeriesIndia) != 7) {
    stop("The number of columns is invalid")
  }
  usethis::use_data(timeSeriesIndia, overwrite = TRUE)
  write.csv(timeSeriesIndia, "csv/timeSeriesIndia.csv", row.names = FALSE)
  print("The time series dataset was updated")
  return(print("Done..."))
}
