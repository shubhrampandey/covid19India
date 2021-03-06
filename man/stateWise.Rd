% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{stateWise}
\alias{stateWise}
\title{The 2019 Novel Coronavirus COVID-19 (2019-nCoV) India State wise Outbreak Dataset}
\format{
A data.frame object
}
\source{
Coronavirus India Database \href{https://www.covid19india.org/}{website}
}
\usage{
stateWise
}
\description{
India state wise outbreak dataset updated daily
}
\details{
The dataset contains the daily state wise numbers summary of the Coronavirus pandemic cases in India. The data includes the following fields:

- State - Name of the state

- Confirmed - Confirmed number of cases

- Recovered - Confirmed number of cases

- Deaths - Total deaths

- Active - Active cases

- Last updated time - Date-time stamp of last updated dataset

- State_code - State code for geospatial map

- Delta_Confirmed - New confirmed cases

- Delta_Recovered - New recovered cases

- Delta_Deaths- New deaths

- State_notes- Comments on numbers
}
\examples{

data(stateWise)

head(stateWise)

}
\keyword{COVID19}
\keyword{India}
\keyword{coronavirus}
\keyword{datasets}
