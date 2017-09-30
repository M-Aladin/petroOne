library(testthat)

# test the following functions:
    # make_search_url
    # get_papers_count
    # read_onepetro



test_that("get_papers_count matches smartwell papers", {
    my_url <- make_search_url(query = "smartwell")
    expect_equal(get_papers_count(my_url), 70)

})


test_that("get_papers_count matches exact *neural network* papers", {
    my_url <- make_search_url(query = "neural network", how = "all")
    expect_equal(get_papers_count(my_url), 2998)
})


# test_that("get_papers_count matches *intelligent completion* papers", {
#     my_url <- make_search_url(query = "intelligent completion")
#     expect_equal(get_papers_count(my_url), 4527)
# })
#
#
# test_that("get_papers_count matches exact *intelligent completion* papers", {
#     my_url <- make_search_url(query = "intelligent completion", how = "all")
#     expect_equal(get_papers_count(my_url), 845)
# })
#
#
# test_that("get_papers_count matches exact *heat transfer* papers", {
#     my_url <- make_search_url(query = "heat transfer", how = "all")
#     expect_equal(get_papers_count(my_url), 7858)
# })
#
# test_that("get_papers_count matches *heat transfer* papers", {
#     my_url <- make_search_url(query = "heat transfer", how = "any")
#     expect_equal(get_papers_count(my_url), 13539)
# })
#
# test_that("get_papers_count matches *heat transfer* papers", {
#     my_url <- make_search_url(query = "heat transfer")
#     expect_equal(get_papers_count(my_url), 13539)
# })
#
#
# test_that("get_papers_count matches *digital oilfield* papers", {
#     my_url <- make_search_url(query = "digital oilfield", how = "all")
#     expect_equal(get_papers_count(my_url), 527)
#     # print(get_papers_count(my_url))
# })
