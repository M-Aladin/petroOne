library(testthat)

test_that("make_search_url matches number of papers from_year to_year", {
    # neural network papers from 1990 to 2000. Exact phrase
    my_url <- make_search_url(query = "neural network",
                              from_year = 1990,
                              to_year   = 2000,
                              how = "all")
    expect_equal(get_papers_count(my_url), 510)

})
