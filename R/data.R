#' Lookup table for water quality.
#'
#' A tibble containing the description of the water quality and a
#' link to the relevant icon.
#'
#' @format A tibble with 4 rows and 3 variables:
#' \describe{
#'   \item{value}{the value corresponding to the water_quality column in the API data}
#'   \item{description}{the description of the water quality}
#'   \item{icon}{a link to a relevant icon for the water quality in question}
#' }
#' @source \url{http://api.vandudsigten.dk/doc/beaches}
"water_quality"



#' Lookup table for weather type.
#'
#' A tibble containing the description of the weather types and a
#' link to the relevant icon.
#'
#' @format A tibble with 15 rows and 3 variables:
#' \describe{
#'   \item{value}{the value corresponding to the weather_type column in the API data}
#'   \item{description}{the description of the weather type}
#'   \item{icon}{a link to a relevant icon for the weather type in question}
#' }
#' @source \url{http://api.vandudsigten.dk/doc/beaches}
"weather_type"
