# Test beach_get_data() and its internals

# null_to_na ----
context("null_to_na")

my_list <- list(x = "text", y = NULL, z = list(w = NULL))
my_list <- badevand:::null_to_na(my_list)

test_that("null_to_na works", {
  expect_false(is.null(my_list$y))
  expect_false(is.null(my_list$z$w))
  expect_true(is.na(my_list$y))
  expect_true(is.na(my_list$z$w))
})

# retrieve_api_data ----
context("retrieve_api_data")

api_data <- badevand:::retrieve_api_data()

test_that("retrieve_api_data has retrieved data", {
  expect_true(is.list(api_data))
  expect_false(is.data.frame(api_data))
  expect_true(length(api_data) != 0)
})


# extract_overview_table ----
context("extract_overview_table")

overview <- badevand:::extract_overview_table(api_data)

test_that("extract_overview_table works", {
  expect_true(is.data.frame(overview))
  expect_true(nrow(overview) != 0)
  expect_true(ncol(overview) != 0)
})

# extract_links ----
context("extract_links")

links <- badevand:::extract_links(api_data)

test_that("extract_links works", {
  expect_true(is.data.frame(links))
  expect_true(nrow(links) != 0)
  expect_true(ncol(links) != 0)
  expect_true(ncol(links) == 2)
})

# extract_meassurements ----
context("extract_meassurements")

meassurements <- badevand:::extract_meassurements(api_data)

test_that("extract_meassurements works", {
  expect_true(is.data.frame(meassurements))
  expect_true(nrow(meassurements) != 0)
  expect_true(ncol(meassurements) != 0)
  expect_true(ncol(meassurements) == 11)
  expect_true(all(purrr::map_lgl(meassurements[,3:11], is.numeric)))
  expect_false(all(purrr::map_lgl(meassurements[,3:11], is.character)))
  expect_true(class(meassurements$date) == "Date")
})

# beach_get_data ----
context("beach_get_data")

beach_data <- badevand::beach_get_data()

test_that("extract_meassurements works", {
  expect_true(is.list(beach_data))
  expect_true(all(names(beach_data) == c("overview", "links", "meassurements")))
  expect_false(is.data.frame(beach_data))
  expect_true(length(beach_data) == 3)
  expect_true(all(purrr::map_lgl(beach_data, tibble::is.tibble)))
  expect_false(all(purrr::map_lgl(beach_data, is.matrix)))
  expect_true(all(purrr::map_int(beach_data, nrow) > 0))
  expect_false(all(purrr::map_int(beach_data, nrow) == 0))
  expect_true(all(purrr::map_int(beach_data, ncol) > 0))
  expect_false(all(purrr::map_int(beach_data, ncol) == 0))
})



