
<!-- README.md is generated from README.Rmd. Please edit that file -->
petroOne
========

The goal of petroOne is to ...

Installation
------------

You can install petroOne from github with:

``` r
# install.packages("devtools")
devtools::install_github("f0nzie/petroOne")
```

Examples
--------

### Get the number of papers for *neural networks*.

``` r
library(petroOne)

my_url <- make_search_url(query = "neural network", how = "any")
my_url
#> [1] "https://www.onepetro.org/search?q=neural+network&peer_reviewed=&published_between=&from_year=&to_year="
get_papers_count(my_url)
#> [1] 3314
# 3284
# 3314
```

### Read papers from from\_year to to\_year

``` r
# neural network papers from 1990 to 2000. Exact phrase
my_url <- make_search_url(query = "neural network", 
                          from_year = 1990, 
                          to_year   = 2000, 
                          how = "all")
get_papers_count(my_url)
#> [1] 510
# 510
```

``` r
library(petroOne)
library(tibble)

my_url <- make_search_url(query = "neural network", 
                          from_year = 1990, 
                          to_year   = 1999, 
                          how = "all")

get_papers_count(my_url)
#> [1] 415
# 415
as.tibble(onepetro_page_to_dataframe(my_url))
#> # A tibble: 10 x 6
#>                                                      title_data
#>                                                           <chr>
#>  1                          Deconvolution Using Neural Networks
#>  2                     Neural Network Stacking Velocity Picking
#>  3                    First Break Picking Using Neural Networks
#>  4             Neural Networks And Paper Seismic Interpretation
#>  5  Seismic Principal Components Analysis Using Neural Networks
#>  6      Artificial Intelligence I Neural Networks In Geophysics
#>  7 Reservoir Characterization Using Feedforward Neural Networks
#>  8          Seismic Attribute Calibration Using Neural Networks
#>  9        Neural Networks For Primary Reflection Identification
#> 10                     Drill-Bit Diagnosis With Neural Networks
#> # ... with 5 more variables: paper_id <chr>, source <chr>, type <chr>,
#> #   year <chr>, author1_data <chr>
```

### Get papers by document type (dc\_type)

``` r
# specify document type = "conference-paper", rows = 1000

my_url <- make_search_url(query = "neural network", 
                          how = "all",
                          dc_type = "conference-paper",
                          rows = 1000)

get_papers_count(my_url)
#> [1] 2687
# 2661
# 2687
as.tibble(onepetro_page_to_dataframe(my_url))
#> # A tibble: 1,000 x 6
#>                                                      title_data
#>                                                           <chr>
#>  1                          Deconvolution Using Neural Networks
#>  2                                      Neural Networks And AVO
#>  3                     Neural Network Stacking Velocity Picking
#>  4                    First Break Picking Using Neural Networks
#>  5             Neural Networks And Paper Seismic Interpretation
#>  6  Seismic Principal Components Analysis Using Neural Networks
#>  7        Estimation of Welding Distortion Using Neural Network
#>  8      Artificial Intelligence I Neural Networks In Geophysics
#>  9 Reservoir Characterization Using Feedforward Neural Networks
#> 10          Seismic Attribute Calibration Using Neural Networks
#> # ... with 990 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

``` r
# specify document type = "journal-paper", rows = 1000

my_url <- make_search_url(query = "neural network", 
                          how = "all",
                          dc_type = "journal-paper",
                          rows = 1000)

get_papers_count(my_url)
#> [1] 304
# 303
# 304
as.tibble(onepetro_page_to_dataframe(my_url))
#> # A tibble: 304 x 6
#>                                                                     title_data
#>                                                                          <chr>
#>  1                   Implicit Approximation of Neural Network and Applications
#>  2                Artificial Neural Networks Identify Restimulation Candidates
#>  3                                    Drill-Bit Diagnosis With Neural Networks
#>  4                 Neural Networks for Predictive Control of Drilling Dynamics
#>  5          An Artificial Neural Network Based Relative Permeability Predictor
#>  6 Characterize Submarine Channel Reservoirs: A Neural- Network-Based Approach
#>  7             Application of Artificial Neural Network to Pump Card Diagnosis
#>  8        Application of Artificial Neural Networks to Downhole Fluid Analysis
#>  9                Neural Network Approach Predicts U.S. Natural Gas Production
#> 10           Pseudodensity Log Generation by Use of Artificial Neural Networks
#> # ... with 294 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

Summaries
---------

``` r
library(petroOne)

my_url <- make_search_url(query = "well test", 
                          how = "all")

result <- read_onepetro(my_url)

as.tibble(summary_by_doctype(result))
#> # A tibble: 7 x 2
#>               name value
#>              <chr> <dbl>
#> 1          Chapter     8
#> 2 Conference paper  9298
#> 3          General   193
#> 4    Journal paper  2529
#> 5            Media     5
#> 6            Other     8
#> 7     Presentation    25
as.tibble(summary_by_publisher(result))
#> # A tibble: 20 x 2
#>                                                     name value
#>                                                    <chr> <dbl>
#>  1                          American Petroleum Institute    42
#>  2                   American Rock Mechanics Association    64
#>  3                                             BHR Group    10
#>  4               Carbon Management Technology Conference     1
#>  5         International Petroleum Technology Conference   364
#>  6              International Society for Rock Mechanics    39
#>  7 International Society of Offshore and Polar Engineers    15
#>  8                                    NACE International    45
#>  9                 National Energy Technology Laboratory     8
#> 10                     Offshore Mediterranean Conference    44
#> 11                        Offshore Technology Conference   506
#> 12                                  Oil Industry Journal    14
#> 13                           Petroleum Society of Canada   396
#> 14                    Pipeline Simulation Interest Group     2
#> 15                  Society of Exploration Geophysicists    75
#> 16                        Society of Petroleum Engineers 10078
#> 17      Society of Petrophysicists and Well-Log Analysts   209
#> 18                      Society of Underwater Technology    12
#> 19        Unconventional Resources Technology Conference    60
#> 20                              World Petroleum Congress    77
as.tibble(summary_by_dates(result))
#> # A tibble: 76 x 2
#>          name value
#>         <chr> <dbl>
#>  1 Since 2017   347
#>  2 Since 2016   913
#>  3 Since 2015  1462
#>  4 Since 2014  2019
#>  5 Since 2013  2530
#>  6 Since 2012  3044
#>  7 Since 2011  3497
#>  8 Since 2010  4023
#>  9 Since 2009  4454
#> 10 Since 2008  4865
#> # ... with 66 more rows
as.tibble(summary_by_publications(result))
#> # A tibble: 575 x 2
#>                                                                 name value
#>                                                                <chr> <dbl>
#>  1           10th North American Conference on Multiphase Technology     1
#>  2                                     10th World Petroleum Congress     1
#>  3                                                11th ISRM Congress     1
#>  4                                     11th World Petroleum Congress     4
#>  5                                                12th ISRM Congress     1
#>  6 12th International Conference on Multiphase Production Technology     2
#>  7                                     12th World Petroleum Congress     3
#>  8                13th ISRM International Congress of Rock Mechanics     1
#>  9 13th International Conference on Multiphase Production Technology     1
#> 10                                     13th World Petroleum Congress     3
#> # ... with 565 more rows
```

Get total number of papers
--------------------------

in multiple pages of 1000 rows (or papers each)

``` r
# we use "conference-paper" only because other document types have
# different dataframe structure

my_url <- make_search_url(query = "neural network", 
                          how = "all",
                          dc_type = "conference-paper",
                          rows = 1000)

get_papers_count(my_url)
#> [1] 2687
# 2661
# 2697 @ 200171009
```

### Collect first 1000 rows out of 2661

``` r
outdir <- system.file("out", package = "petroOne")
```

``` r
my_url_1 <- make_search_url(query = "neural network", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 0,
                          rows  = 1000)

get_papers_count(my_url_1)
#> [1] 2687

page_1 <- read_onepetro(my_url_1)
htm_1 <- paste(outdir, "1000_conference.html", sep = "/")
xml2::write_html(page_1, file = htm_1)
as.tibble(onepetro_page_to_dataframe(htm_1))
#> # A tibble: 1,000 x 6
#>                                                      title_data
#>                                                           <chr>
#>  1                          Deconvolution Using Neural Networks
#>  2                                      Neural Networks And AVO
#>  3                     Neural Network Stacking Velocity Picking
#>  4                    First Break Picking Using Neural Networks
#>  5             Neural Networks And Paper Seismic Interpretation
#>  6  Seismic Principal Components Analysis Using Neural Networks
#>  7        Estimation of Welding Distortion Using Neural Network
#>  8      Artificial Intelligence I Neural Networks In Geophysics
#>  9 Reservoir Characterization Using Feedforward Neural Networks
#> 10          Seismic Attribute Calibration Using Neural Networks
#> # ... with 990 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

### Collect second set of 1000 rows out of 2661

``` r
my_url_2 <- make_search_url(query = "neural network", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 1000,
                          rows  = 1000)

page_2 <- read_onepetro(my_url_2)
htm_2 <- paste(outdir, "2000_conference.html", sep = "/")
xml2::write_html(page_2, file = htm_2)
as.tibble(onepetro_page_to_dataframe(htm_2))
#> # A tibble: 1,000 x 6
#>                                                                     title_data
#>                                                                          <chr>
#>  1 Pore Pressure Prediction Using High Resolution Velocity And Acoustic Impeda
#>  2 Single Gas Flow Prediction through Chokes using Artificial Intelligence Tec
#>  3 A Production Performance Prediction and Field Development Tool for Coalbed 
#>  4   Rock Mechanical Properties of Shallow Unconsolidated Sandstone Formations
#>  5 Challenges in Using Operational Data for Reliable Wind Turbine Condition Mo
#>  6             Production Optimization Strategy Using Hybrid Genetic Algorithm
#>  7 Modelling Pipeline and Choke Optimization for Improved Gas Field Production
#>  8 Estimating Saturation Changes from 4D Seismic: A Case Study from Malay Basi
#>  9               Automated Reservoir Surveillance through Data Mining Software
#> 10                            Improvements to Computer Based Fault Extractions
#> # ... with 990 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

### Collect remaining set of 1000 rows out of 2661

``` r
my_url_3 <- make_search_url(query = "neural network", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 2000,
                          rows  = 1000)

page_3 <- read_onepetro(my_url_3)
htm_3 <- paste(outdir, "3000_conference.html", sep = "/")
xml2::write_html(page_3, file = htm_3)
as.tibble(onepetro_page_to_dataframe(htm_3))
#> # A tibble: 687 x 6
#>                                                                     title_data
#>                                                                          <chr>
#>  1 Cyclic Behavior of Laterally Loaded Piles in Soils With Variable Properties
#>  2 A New Approach to Predict Failure Parameters of Carbonate Rocks using Artif
#>  3 Seismic to Simulation Fracture Characterization of a Green Carbonate Reserv
#>  4                                           Advanced Streaming Data Cleansing
#>  5                Wave Height Forecast Using Self-Organization Algorithm Model
#>  6          The Role Of Ocean Engineers In Japanese Ocean Measurement Research
#>  7                  Field Evaluation Of A Hydrate Inhibition Monitoring System
#>  8 Data-Driven Brittleness Index Prediction From Elemental Spectroscopy and Pe
#>  9 Maximize the placement of wells and production in unconventional reservoirs
#> 10     Integrity Monitoring of Offshore Platforms Using Artificial Neural Nets
#> # ... with 677 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```
