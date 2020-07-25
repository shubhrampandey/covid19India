#' @title Update all the datasets
#' @description This function updates all the datasets in the repository in a single call
#' @author Shubhram Pandey
#' @export
updateAllData <- function(){

  flag <- FALSE

  stateWiseCurrent <- covid19India::stateWise
  timeSeriesIndiaCurrent <- covid19India::timeSeriesIndia

  stateWiseGit <- utils::read.csv("https://raw.githubusercontent.com/shubhrampandey/covid19India/master/csv/stateWise.csv",
                               stringsAsFactors = FALSE)

  timeSeriesIndiaGit <- utils::read.csv("https://raw.githubusercontent.com/shubhrampandey/covid19India/master/csv/timeSeriesIndia.csv",
                                stringsAsFactors = FALSE)

  if (!base::identical(stateWiseGit, stateWiseCurrent)) {
    if(stateWiseGit$Confirmed[1] != stateWiseCurrent$Confirmed[1]){
      flag <- TRUE
    }
  }

  if (!base::identical(timeSeriesIndiaGit, timeSeriesIndiaCurrent)){
    if(timeSeriesIndiaGit$Daily.Confirmed[base::nrow(timeSeriesIndiaGit)] != timeSeriesIndiaCurrent$Daily.Confirmed[base::nrow(timeSeriesIndiaCurrent)]) {
      flag <- TRUE
    }
  }

  if(flag){
    q <- base::tolower(base::readline("Updates are available on the covid19italy Dev version, do you want to update? n/Y"))

    if(q == "y" | q == "yes"){

      detach("package:covid19India", unload = TRUE)
      base::tryCatch(
        expr = {
          devtools::install_github("shubhrampandey/covid19India")

          base::message("The data was refresed...")
        },
        error = function(e){
          message('Caught an error!')
          print(e)
        },
        warning = function(w){
          message('Caught an warning!')
          print(w)
        }

      )
    }
  } else {
    base::message("No updates are available")
  }
}
