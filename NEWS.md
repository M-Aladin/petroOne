## 20171009 0.1.0.9002
* paper types do not return complete info in first query. It has to be specified in the type combobox. Problem moved to `test_failing.Rmd`
* new vignette `paper_types.Rmd` to show how to obtain papers by document type. The document types that are homogeneous and return in the first query are: conference papers, jornal papers, general papers, presentation papers and chapter papers. Non-homogeneous: other and media types.

## 20171009 0.1.0.9001
* use tibbles to prevent long printing of dataframes
* use as.tibble in functions onepetro_page_to_dataframe and summary_by_xxx
* reordering chunks in README
* improve explanation of what to do when we have more than 1000 papers to retrieve


## 20171009 0.1.0.9000
* use as.tibble to avoid long printing of dataframes
* show first attempt of splitting paper pages in groups of 1000. Using example of "neural networks" which has 2661 conference-papers. For the time being using one type of papers because other document types have a different number of columns and causes a conflict with the dataframe binding. Working on it.
* build site with pkgdown
* add documentation for datasets
* add tolerance to expect_equal because number of paper keeps growing
* Added a `NEWS.md` file to track changes to the package.



