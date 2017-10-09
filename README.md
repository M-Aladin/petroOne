
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

We can send a query where we specify the starting years and the end year. Use the parameters as in the example below.

``` r
library(petroOne)

# neural network papers from 1990 to 2000. Exact phrase
my_url <- make_search_url(query = "neural network", 
                          from_year = 1990, 
                          to_year   = 1999, 
                          how = "all")

get_papers_count(my_url)
#> [1] 415
# 415
# 510
onepetro_page_to_dataframe(my_url)
#> # A tibble: 10 x 6
#>                                                      title_data
#>                                                           <chr>
#>  1                          Deconvolution Using Neural Networks
#>  2                     Neural Network Stacking Velocity Picking
#>  3                     Drill-Bit Diagnosis With Neural Networks
#>  4      Artificial Intelligence I Neural Networks In Geophysics
#>  5         Inversion of Seismic Waveforms Using Neural Networks
#>  6             Neural Networks And Paper Seismic Interpretation
#>  7                    First Break Picking Using Neural Networks
#>  8     Conductive fracture identification using neural networks
#>  9 Reservoir Characterization Using Feedforward Neural Networks
#> 10          Seismic Attribute Calibration Using Neural Networks
#> # ... with 5 more variables: paper_id <chr>, source <chr>, type <chr>,
#> #   year <chr>, author1_data <chr>
```

Get papers by document type (dc\_type)
--------------------------------------

We can also get paper by the type of document. In this example we are requesting only "conference-paper" type.

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
onepetro_page_to_dataframe(my_url)
#> # A tibble: 1,000 x 6
#>                                                  title_data
#>                                                       <chr>
#>  1                                  Neural Networks And AVO
#>  2                      Deconvolution Using Neural Networks
#>  3                 Neural Network Stacking Velocity Picking
#>  4 Predicting Wax Formation Using Artificial Neural Network
#>  5    Estimation of Welding Distortion Using Neural Network
#>  6  Artificial Intelligence I Neural Networks In Geophysics
#>  7     Inversion of Seismic Waveforms Using Neural Networks
#>  8         Neural Networks And Paper Seismic Interpretation
#>  9 Dynamic Neural Network Calibration of Quartz Transducers
#> 10                First Break Picking Using Neural Networks
#> # ... with 990 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

In this other example we are requesting for "journal-paper" type of papers.

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
onepetro_page_to_dataframe(my_url)
#> # A tibble: 304 x 6
#>                                                                     title_data
#>                                                                          <chr>
#>  1                Artificial Neural Networks Identify Restimulation Candidates
#>  2                                    Drill-Bit Diagnosis With Neural Networks
#>  3                   Implicit Approximation of Neural Network and Applications
#>  4                 Neural Networks for Predictive Control of Drilling Dynamics
#>  5             Application of Artificial Neural Network to Pump Card Diagnosis
#>  6        Application of Artificial Neural Networks to Downhole Fluid Analysis
#>  7                Neural Network Approach Predicts U.S. Natural Gas Production
#>  8                      Neural Network: What It Can Do for Petroleum Engineers
#>  9 Treating Uncertainties in Reservoir-Performance Prediction With Neural Netw
#> 10 Characterize Submarine Channel Reservoirs: A Neural- Network-Based Approach
#> # ... with 294 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

What to do when we have more than a thousand papers
---------------------------------------------------

### 1. Get total number of papers

First, we need to find what is the total number of papers for a particular query. In this search we want all papers that have exact words "neural network".

``` r

my_url <- make_search_url(query = "neural network", 
                          how = "all")

get_papers_count(my_url)
#> [1] 3025
# 3025 @ 200171009   total number of papers
```

### 2. Find type of papers

In this example we investigate the type of papers available for a given search. In this case, we want exact match of "neural network" words.

``` r
result <- read_onepetro(my_url)
summary_by_doctype(result)
#> # A tibble: 6 x 2
#>               name value
#>              <chr> <dbl>
#> 1 Conference paper  2687
#> 2          General     4
#> 3    Journal paper   304
#> 4            Media     2
#> 5            Other     5
#> 6     Presentation    23
```

We see that most numerous papers are from conferences. We will proceed to gran the paper titles of those.

### 3. Retrieve the most numerous paper by type

``` r
# folder where we will save the results
outdir <- system.file("out", package = "petroOne")
```

#### 3.1 Collect first 1000 rows out of 2687

``` r
# we use "conference-paper" only because other document types have
# different dataframe structure

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
onepetro_page_to_dataframe(htm_1)
#> # A tibble: 1,000 x 6
#>                                                  title_data
#>                                                       <chr>
#>  1                                  Neural Networks And AVO
#>  2                      Deconvolution Using Neural Networks
#>  3                 Neural Network Stacking Velocity Picking
#>  4 Predicting Wax Formation Using Artificial Neural Network
#>  5    Estimation of Welding Distortion Using Neural Network
#>  6  Artificial Intelligence I Neural Networks In Geophysics
#>  7     Inversion of Seismic Waveforms Using Neural Networks
#>  8         Neural Networks And Paper Seismic Interpretation
#>  9 Dynamic Neural Network Calibration of Quartz Transducers
#> 10                First Break Picking Using Neural Networks
#> # ... with 990 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

#### 3.2 Collect second set of 1000 rows

``` r
my_url_2 <- make_search_url(query = "neural network", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 1000,
                          rows  = 1000)

page_2 <- read_onepetro(my_url_2)
htm_2 <- paste(outdir, "2000_conference.html", sep = "/")
xml2::write_html(page_2, file = htm_2)
onepetro_page_to_dataframe(htm_2)
#> # A tibble: 1,000 x 6
#>                                                                     title_data
#>                                                                          <chr>
#>  1 Reducing Uncertainty in Characterization Of Vaca Mureta Shale with Post-Sta
#>  2 Understanding the Distribution Pattern of Prospective Reservoir Facies: A S
#>  3 Estimation of Rock Mechanical Parameters Using Artificial Intelligence Tool
#>  4 A Neuro-Fuzzy Approach for Prediction of Poisson's Ratio and Young's Modulu
#>  5 Practical Implementation of Knowledge-Based Approaches for SAGD Production 
#>  6 Optimizing the Performance of ANFIS using the Genetic Algorithm to Estimate
#>  7 Multi-Scale Characterization of Pore Structure in Carbonate Formations: App
#>  8 "Indirect Estimation of Fluid Transport and Rock Mechanical Properties from
#>  9 A Model For Predicting Corrosion Rates In Oil Wells Containing Carbon Dioxi
#> 10 Integration and Data Analysis of Conventional Core Data with NMR and CT Dat
#> # ... with 990 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

#### 3.3 Collect remaining set of 1000 rows

``` r
my_url_3 <- make_search_url(query = "neural network", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 2000,
                          rows  = 1000)

page_3 <- read_onepetro(my_url_3)
htm_3 <- paste(outdir, "3000_conference.html", sep = "/")
xml2::write_html(page_3, file = htm_3)
onepetro_page_to_dataframe(htm_3)
#> # A tibble: 687 x 6
#>                                                                     title_data
#>                                                                          <chr>
#>  1          The Role Of Ocean Engineers In Japanese Ocean Measurement Research
#>  2 Data-Driven Brittleness Index Prediction From Elemental Spectroscopy and Pe
#>  3 A New Technique to Determine Porosity and Deep Resistivity from Old Gamma R
#>  4                                           Advanced Streaming Data Cleansing
#>  5 Cyclic Behavior of Laterally Loaded Piles in Soils With Variable Properties
#>  6 An Improved And Optimized Positioning Method Of Microseismic Source In Mini
#>  7                  Field Evaluation Of A Hydrate Inhibition Monitoring System
#>  8            Multiphase Flow Metering: Current Status and Future Developments
#>  9 Analysis of Influencing Factors of Water Traffic Accidents Severity Based o
#> 10                  A Novel Model for Permeability Prediction in Uncored Wells
#> # ... with 677 more rows, and 5 more variables: paper_id <chr>,
#> #   source <chr>, type <chr>, year <chr>, author1_data <chr>
```

Summaries
---------

Here is a nother example of summaries. In this case, we want papers that contain the exact words "well test".

``` r
library(petroOne)

my_url <- make_search_url(query = "well test", 
                          how = "all")

result <- read_onepetro(my_url)

summary_by_doctype(result)
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
summary_by_publisher(result)
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
summary_by_dates(result)
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
summary_by_publications(result)
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

In this other example, we want papers that containg the word "well" or "test".

``` r
library(petroOne)

my_url <- make_search_url(query = "well test", 
                          how = "any")

result <- read_onepetro(my_url)

summary_by_doctype(result)
#> # A tibble: 8 x 2
#>               name value
#>              <chr> <dbl>
#> 1          Chapter    60
#> 2 Conference paper 86778
#> 3          General   932
#> 4    Journal paper 15825
#> 5            Media     9
#> 6            Other    21
#> 7     Presentation   265
#> 8         Standard    95
summary_by_publisher(result)
#> # A tibble: 22 x 2
#>                                                     name value
#>                                                    <chr> <dbl>
#>  1                          American Petroleum Institute   676
#>  2                   American Rock Mechanics Association  3851
#>  3                  American Society of Safety Engineers  1098
#>  4                                             BHR Group   221
#>  5               Carbon Management Technology Conference    82
#>  6         International Petroleum Technology Conference  1774
#>  7              International Society for Rock Mechanics  3975
#>  8 International Society of Offshore and Polar Engineers  7408
#>  9                                    NACE International  7708
#> 10                 National Energy Technology Laboratory    21
#> # ... with 12 more rows
summary_by_dates(result)
#> # A tibble: 103 x 2
#>          name value
#>         <chr> <dbl>
#>  1 Since 2017  3543
#>  2 Since 2016  8690
#>  3 Since 2015 14264
#>  4 Since 2014 19543
#>  5 Since 2013 24213
#>  6 Since 2012 28710
#>  7 Since 2011 32778
#>  8 Since 2010 36993
#>  9 Since 2009 40482
#> 10 Since 2008 43857
#> # ... with 93 more rows
summary_by_publications(result)
#> # A tibble: 823 x 2
#>                                                                 name value
#>                                                                <chr> <dbl>
#>  1                                                10th ISRM Congress   109
#>  2           10th North American Conference on Multiphase Technology    20
#>  3                                     10th World Petroleum Congress    82
#>  4                                                11th ISRM Congress   123
#>  5                                     11th World Petroleum Congress    74
#>  6                                                12th ISRM Congress   196
#>  7 12th International Conference on Multiphase Production Technology    31
#>  8                                     12th World Petroleum Congress    54
#>  9                13th ISRM International Congress of Rock Mechanics   228
#> 10 13th International Conference on Multiphase Production Technology    25
#> # ... with 813 more rows
```
