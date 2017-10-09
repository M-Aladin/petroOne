#' petroOne.
#'
#' @name petroOne
#' @docType package
NULL


#' @title Discipline and Subject  labels dataset
#' @description dataset containing disciplines and subjects.
#' The purpose is to categorize papers based on the words in their title since
#' OnePetro does not supply keywords or any sort of categorization.
#' File:  disciplines.rda
#' Class: data.frame
#' @docType data
"labels"

#' @title Default custom stop words
#' @description This is a minimal dataset of custom stopwords.
#' Tou can supply your own stopwords by editing the file stopwords.txt and
#' then importing them. But this is a basic way to start and eliminate
#' common words from the paper titles during clasification.
#' Dataset: stopwords.rda
#' Source:  stopwords.txt
#' Class:   char vector
#' @docType data
"custom_stopwords"

#' @title Default synonyms
#' @description Synonyms dataset to prevent repetition of equivalent words
#' during classification. Example: 2D/2-D, cased hole/cased-hole,
#' deep water/deepwater, etc.
#' The first column is for the original word; the second column is for the
#' replacement or standard word.
#' Dataset: synonyms.rda
#' Source:  synonyms.txt
#' Class:   data.frame
#' @docType data
"custom_synonyms"
