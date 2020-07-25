#' The 2019 Novel Coronavirus COVID-19 (2019-nCoV) India State wise Outbreak Dataset
#'
#' @description  India state wise outbreak dataset updated daily
#'
#' @format A data.frame object
#' @source Coronavirus India Database \href{https://www.covid19india.org/}{website}
#' @keywords datasets coronavirus COVID19 India
#' @details The dataset contains the daily state wise numbers summary of the Coronavirus pandemic cases in India. The data includes the following fields:
#'
#' - State - Name of the state
#'
#' - Confirmed - Confirmed number of cases
#'
#' - Recovered - Confirmed number of cases
#'
#' - Deaths - Total deaths
#'
#' - Active - Active cases
#'
#' - Last updated time - Date-time stamp of last updated dataset
#'
#' - State_code - State code for geospatial map
#'
#' - Delta_Confirmed - New confirmed cases
#'
#' - Delta_Recovered - New recovered cases
#'
#' - Delta_Deaths- New deaths
#'
#' - State_notes- Comments on numbers
#'
#' @examples
#'
#' data(stateWise)
#'
#' head(stateWise)
#'

"stateWise"


#' The 2019 Novel Coronavirus COVID-19 (2019-nCoV) India time series Outbreak Dataset
#'
#' @description  India time series outbreak dataset updated daily
#'
#' @format A data.frame object
#' @source Coronavirus India Database \href{https://www.covid19india.org/}{website}
#' @keywords datasets coronavirus COVID19 India
#' @details The dataset contains the time series numbers of confirmed, recovered and death of the Coronavirus pandemic cases in India. The data includes the following fields:
#'
#' - Date - Date
#'
#' - Daily.Confirmed - Daily Confirmed cases
#'
#' - Total.Confirmed - Cumulative confirmed cases
#'
#' - Daily.Recovered - Daily Recovered cases
#'
#' - Total.Recovered - Cumulative Recovered cases
#'
#' - Daily.Deceased - Daily Deaths cases
#'
#' - Total.Deceased- Cumulative Deaths cases
#'
#' @examples
#'
#' data(timeSeriesIndia)
#'
#' head(timeSeriesIndia)
#'

"timeSeriesIndia"


#' The 2019 Novel Coronavirus COVID-19 (2019-nCoV) State wise time series Outbreak Dataset
#'
#' @description  State wise time series outbreak dataset updated daily
#'
#' @format A data.frame object
#' @source Coronavirus India Database \href{https://www.covid19india.org/}{website}
#' @keywords datasets coronavirus COVID19 India
#' @details The dataset contains the time series numbers of confirmed, recovered and death of the Coronavirus pandemic cases in India state wise. The data includes the following fields:
#'
#' - Date - Date
#'
#' - Status - Variable like (Confirmed, recovered and deaths)
#'
#' - TT - Total of variables
#'
#' - .... - Rest of the columns are states with coded as state key
#'
#' @examples
#'
#' data(stateWiseTimeSeries)
#'
#' head(stateWiseTimeSeries)
#'

"stateWiseTimeSeries"
