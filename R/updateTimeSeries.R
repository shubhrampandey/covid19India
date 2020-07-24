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
  timeSeriesIndiaOld = covid19India::timeSeriesIndia
  timeSeriesIndia <- read.csv("https://api.covid19india.org/csv/latest/case_time_series.csv",
                         stringsAsFactors = FALSE) %>%
                         select(-Date) %>%
                         mutate(Date = seq(as.Date("2020-01-30"),as.Date("2020-01-30") + (nrow(.) - 1),by = 1)) %>%
    select(Date,dplyr::everything())
  if (ncol(timeSeriesIndia) != 7) {
    stop("The number of columns is invalid")
  }
  if (nrow(timeSeriesIndia) > nrow(timeSeriesIndiaOld)) {
    print("Updates available")
    usethis::use_data(timeSeriesIndia, overwrite = TRUE)
    save(timeSeriesIndia, file = "data/timeSeriesIndia.Rda")
    write.csv(timeSeriesIndia, "csv/timeSeriesIndia.csv", row.names = FALSE)
    print("The time series dataset was updated")
  } else {
    print("Updates are not available")
  }
  return(print("Done..."))
}
