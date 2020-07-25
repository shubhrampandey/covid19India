## code to prepare `stateWise` dataset goes here

#' @title Update state wise data
#' @description This function updates state wise data on daily basis from website
#' @param branch default branch is master
#' @author Shubhram Pandey
#' @import dplyr usethis utils rlang
updateStateWiseTimeSeries <- function(branch = "master"){
  # library(covid19India)
  library(dplyr)
  print(paste0("Branch name:",branch))
  if (branch != "master") {
    stop("The branch argument is missing")
  }
  stateWiseTimeSeriesOld = covid19India::stateWiseTimeSeries
  stateWiseTimeSeries <- read.csv("https://api.covid19india.org/csv/latest/state_wise_daily.csv",
                        stringsAsFactors = FALSE) %>%
    select(-c("Date")) %>%
    mutate(Date = rep(seq(as.Date("2020-03-14"),
                      as.Date("2020-03-14") + ((nrow(.)/3) - 1),
                      by = 1),
                      each = 3)
                      ) %>%
    select("Date",dplyr::everything())

  if (base::nrow(stateWiseTimeSeries) >= base::nrow(stateWiseTimeSeriesOld)) {
    print("Updates available")
    # covid19India::stateWise = stateWise
    usethis::use_data(stateWiseTimeSeries, overwrite = TRUE)
    save(stateWiseTimeSeries, file = "data/stateWiseTimeSeries.rda")
    write.csv(stateWiseTimeSeries, "csv/stateWiseTimeSeries.csv", row.names = FALSE)
    print("The stateWiseTimeSeries dataset was updated")
  } else {
    print("Updates are not available")
  }
  return(print("Done..."))

}

