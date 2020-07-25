## code to refresh data at developer level in a single function

#' @title Refresh all the data in a single function
#' @description Code to refresh data at developer level in a single function
#' @param branch default branch is master
#' @author Shubhram Pandey
#' @import dplyr usethis utils rlang
dataRefresh <- function(branch = "master"){
  # library(covid19India)
  library(dplyr)
  stateWise <- read.csv("https://api.covid19india.org/csv/latest/state_wise.csv",
                        stringsAsFactors = FALSE) %>%
                dplyr::select(-c("Migrated_Other"))
    save(stateWise, file = "data/stateWise.Rda")
    write.csv(stateWise, "csv/stateWise.csv", row.names = FALSE)

    timeSeriesIndia <- read.csv("https://api.covid19india.org/csv/latest/case_time_series.csv",
                                stringsAsFactors = FALSE) %>%
      select(-c("Date")) %>%
      mutate(Date = seq(as.Date("2020-01-30"),as.Date("2020-01-30") + (nrow(.) - 1),by = 1)) %>%
      select("Date",dplyr::everything())
      save(timeSeriesIndia, file = "data/timeSeriesIndia.Rda")
      write.csv(timeSeriesIndia, "csv/timeSeriesIndia.csv", row.names = FALSE)


      stateWiseTimeSeries <- read.csv("https://api.covid19india.org/csv/latest/state_wise_daily.csv",
                                      stringsAsFactors = FALSE) %>%
        select(-c("Date")) %>%
        mutate(Date = rep(seq(as.Date("2020-03-14"),
                              as.Date("2020-03-14") + ((nrow(.)/3) - 1),
                              by = 1),
                          each = 3)
        ) %>%
        select("Date",dplyr::everything())
      save(stateWiseTimeSeries, file = "data/stateWiseTimeSeries.rda")
      write.csv(stateWiseTimeSeries, "csv/stateWiseTimeSeries.csv", row.names = FALSE)


  return(print("Done..."))

}

