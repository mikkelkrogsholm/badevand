% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{weather_type}
\alias{weather_type}
\title{Lookup table for weather type.}
\format{A tibble with 15 rows and 3 variables:
\describe{
  \item{value}{the value corresponding to the weather_type column in the API data}
  \item{description}{the description of the weather type}
  \item{icon}{a link to a relevant icon for the weather type in question}
}}
\source{
\url{http://api.vandudsigten.dk/doc/beaches}
}
\usage{
weather_type
}
\description{
A tibble containing the description of the weather types and a
link to the relevant icon.
}
\keyword{datasets}
