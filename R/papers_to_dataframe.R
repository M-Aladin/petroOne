
#' @title Reads a OnePetro URL and converts it to a dataframe
#' @description A OnePetro URL with a query is read into a HTML page and
#' converted to a dataframe
#' @param url char a OnePetro type URL
#' @export
onepetro_page_to_dataframe <- function(url) {
    webpage <- read_html(url)
    df_titles  <- read_titles(webpage)
    df_sources <- read_sources(webpage)
    df_author  <- read_author(webpage)

    # ensure that all dataframe have the same number of rows
    if (all(dim(df_titles)[1]  == dim(df_sources)[1],
            dim(df_sources)[1] == dim(df_author)[1],
            dim(df_author)[1]  == dim(df_titles)[1]
    ))
        df <- cbind(df_titles, df_sources, df_author)
    else
        stop("Dataframe sizes different")  # otherwise, stop

    return(tibble::as.tibble(df))
}





onepetro_allpages_to_dataframe <- function(url) {
    # webpage <- read_html(url)
    papers_count <- get_papers_count(url)
    if (papers_count > 1000) {
        num_pages <- papers_count / 1000
    } else {
        num_pages = 1
    }

    info <- list(papers = papers_count, pages1000 = num_pages)

    for (page in seq_len(num_pages)) {
        # webpage <- read_html(url)

    }
    info
}


#' @importFrom rvest html_nodes html_text
read_titles <- function(webpage) {

    # title
    # .result-link

    #Using CSS selectors to scrap the rankings section
    title_data_html <- html_nodes(webpage, '.result-link')

    # Converting the ranking data to text
    title_data <- html_text(title_data_html)

    # data pre-processing
    title_data <- trimws(gsub("\n", "",title_data))


    #Let's have a look at the rankings
    title_data <- data.frame(title_data, stringsAsFactors = FALSE)
    # write.csv(df, file = "3000-conf.csv")
    return(title_data)
}

#' @importFrom rvest html_nodes html_text
read_sources <- function(webpage) {
    # year, paper id, institution, type, year
    # .result-item-source

    #Using CSS selectors to scrap the rankings section
    source_data_html <- html_nodes(webpage, '.result-item-source')

    #Converting the ranking data to text
    source_data <- html_text(source_data_html)

    # pre-processing. split at \n
    source_data <- data.frame(do.call('rbind', strsplit(as.character(source_data),
                                                        '\n',fixed=TRUE)),
                              stringsAsFactors = FALSE)
    # remove blank columns
    source_data <- source_data[, 2:5]
    # rename columns
    names(source_data) <- c("paper_id", "source", "type", "year")
    # remove dash from year
    source_data$year <- gsub("-", "", source_data$year)

    # Let's have a look at the paper source data
    source_data
}

#' @importFrom rvest html_nodes html_text
read_author <- function(webpage) {
    # author #1
    #Using CSS selectors to scrap the rankings section
    author1_data_html <- html_nodes(webpage, '.result-item-author:nth-child(1)')

    #Converting the ranking data to text
    author1_data <- html_text(author1_data_html)

    # data pre-processing
    author1_data <- trimws(gsub("\n", "", author1_data))

    #Let's have a look at the rankings
    data.frame(author1_data, stringsAsFactors = FALSE)
}
