# null_to_na ----

#' Turns nulls to nas
#'
#' @param mylist a list
#'
#' @return a list
null_to_na <- function(mylist){
  lapply(mylist, function(x){
    if(is.list(x)){
      null_to_na(x)
    } else {
      if(is.null(x)) NA_character_ else x
    }
  })
}

# retrieve_api_data ----
#' Retrieve data from the api
#'
#' Calls the API, retrieves the data and returns it as a list.
#'
#' @return a list of data
retrieve_api_data <- function(){
  url <- "http://api.vandudsigten.dk/beaches"

  call_data <- httr::GET(url)

  httr::warn_for_status(call_data)

  call_content <- httr::content(call_data)

  call_content <- null_to_na(call_content)

  return(call_content)
}

# extract_overview_table ----
#' Extract overview of beaches
#'
#' @param call_content the data from the api call
#'
#' @return a tibble
extract_overview_table <- function(call_content){

  overview <- purrr::map_df(call_content, function(x){
    cols <- c("id", "municipality", "municipality_url", "name", "description",
              "latitude", "longitude", "comments", "facilities")
    x <- x[cols]

    return(x)
  })

  return(overview)
}

# extract_links ----
#' Extract the links
#'
#' Extracts the links where available
#'
#' @param call_content the data from the api call
#'
#' @return a tibble
#' @importFrom magrittr %>%
extract_links <- function(call_content){

  links <- purrr::map_df(call_content, function(x){
    cols <- c("id", "links")
    x <- x[cols]
    if(length(x$links) == 0) x$links <- list(NA_character_)
    tibble::as.tibble(x)
  })

  links <- tidyr::unnest(links, links)

  links$links <- links$links %>%
    stringr::str_extract_all("(href=')(.)+('>)") %>%
    stringr::str_replace_all("(href=')|('>)", "") %>%
    unlist(use.names = FALSE)

  links <- links %>% tidyr::drop_na()

  return(links)
}

# extract_meassurements ----
#' Extract the meassurements
#'
#' @param call_content the data from the api call
#'
#' @return a tibble
#' @importFrom magrittr %>%
extract_meassurements <- function(call_content){

  # Extract the data
  out <- purrr::map_df(call_content, function(x){
    id <- x$id
    data <- x$data %>% dplyr::bind_rows()
    n <- names(data)
    data$id <- id
    data <- data[c("id", n)]
    data
  })

  # Convert the ones that need to be numeric to numeric
  out[,3:11] <- purrr::map_df(out[,3:11], function(x){
    x <- stringr::str_replace_all(x, ",", ".")
    x <- as.numeric(x)
    x
  })

  # Convert date to a date class
  out$date <- lubridate::ymd(out$date)

  return(out)
}

# beach_get_data ----
#' Retrieve data for danish beaches
#'
#' @return a list of tibbles with the data
#' @export
#'
#' @examples
#' beach_data <- badevand::beach_get_data()
#'
beach_get_data <- function(){

  # Get data
  api_data <- retrieve_api_data()

  # Extract the overview of beaches
  overview <- extract_overview_table(api_data)

  # Extract the overview of the links
  links <- extract_links(api_data)

  # Extract the meassurements
  meassurements <- extract_meassurements(api_data)

  # Gather all in a list
  out <- list(
    overview = overview,
    links = links,
    meassurements = meassurements
  )

  # Return the data
  return(out)
}



