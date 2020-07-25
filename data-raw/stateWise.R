## code to prepare `stateWise` dataset goes here

#' @title Update state wise data
#' @description This function updates state wise data on daily basis from website
#' @param branch default branch is master
#' @author Shubhram Pandey
#' @import dplyr usethis utils rlang
updateStateWise <- function(branch = "master"){
  # library(covid19India)
  library(dplyr)
  print(paste0("Branch name:",branch))
  if (branch != "master") {
    stop("The branch argument is missing")
  }
  stateWiseOld = covid19India::stateWise
  stateWise <- read.csv("https://api.covid19india.org/csv/latest/state_wise.csv",
                        stringsAsFactors = FALSE) %>%
    dplyr::select(-c("Migrated_Other"))
  if (ncol(stateWise) != 11) {
    stop("The number of columns is invalid")
  }
  if (stateWise$Confirmed[1] != stateWiseOld$Confirmed[1]) {
    print("Updates available")
    # covid19India::stateWise = stateWise
    usethis::use_data(stateWise, overwrite = TRUE)
    save(stateWise, file = "data/stateWise.Rda")
    write.csv(stateWise, "csv/stateWise.csv", row.names = FALSE)
    print("The stateWise dataset was updated")
  } else {
    print("Updates are not available")
  }
  return(print("Done..."))

}

