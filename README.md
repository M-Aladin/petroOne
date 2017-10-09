
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

my_url <- make_search_url(query = "neural network", 
                          from_year = 1990, 
                          to_year   = 1999, 
                          how = "all")

get_papers_count(my_url)
#> [1] 415
# 415
head(onepetro_page_to_dataframe(my_url))
#>                                                    title_data
#> 1                         Deconvolution Using Neural Networks
#> 2                    Neural Network Stacking Velocity Picking
#> 3                   First Break Picking Using Neural Networks
#> 4            Neural Networks And Paper Seismic Interpretation
#> 5 Seismic Principal Components Analysis Using Neural Networks
#> 6     Artificial Intelligence I Neural Networks In Geophysics
#>               paper_id         source                       type
#> 1           1996-1611            SEG            Conference Paper
#> 2           1992-0018            SEG            Conference Paper
#> 3           1990-0370            SEG            Conference Paper
#> 4           1995-0142            SEG            Conference Paper
#> 5           1996-1259            SEG            Conference Paper
#> 6           1992-0001            SEG            Conference Paper
#>               year
#> 1             1996
#> 2             1992
#> 3             1990
#> 4             1995
#> 5             1996
#> 6             1992
#>                                                             author1_data
#> 1                              Essenreiter, Robert, Karlsruhe University
#> 2                                    Schmidt, Jumndyr, Petrobras, Brazil
#> 3                                     Wagner, D.E., Amoco Production Co.
#> 4                                        Leggett, Miles, British Gas plc
#> 5       Huang, Kou-Yuan, National Chiao Tung University, Hsinchu, Taiwan
#> 6 Guo, Yi, Center for Potential Fields Studies, Colorado School of Mines
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
head(onepetro_page_to_dataframe(my_url))
#>                                                    title_data
#> 1                         Deconvolution Using Neural Networks
#> 2                                     Neural Networks And AVO
#> 3                    Neural Network Stacking Velocity Picking
#> 4                   First Break Picking Using Neural Networks
#> 5            Neural Networks And Paper Seismic Interpretation
#> 6 Seismic Principal Components Analysis Using Neural Networks
#>               paper_id         source                       type
#> 1           1996-1611            SEG            Conference Paper
#> 2           2002-0229            SEG            Conference Paper
#> 3           1992-0018            SEG            Conference Paper
#> 4           1990-0370            SEG            Conference Paper
#> 5           1995-0142            SEG            Conference Paper
#> 6           1996-1259            SEG            Conference Paper
#>               year
#> 1             1996
#> 2             2002
#> 3             1992
#> 4             1990
#> 5             1995
#> 6             1996
#>                                                       author1_data
#> 1                        Essenreiter, Robert, Karlsruhe University
#> 2           Russell, Brian, Hampson-Russell Software Services Ltd.
#> 3                              Schmidt, Jumndyr, Petrobras, Brazil
#> 4                               Wagner, D.E., Amoco Production Co.
#> 5                                  Leggett, Miles, British Gas plc
#> 6 Huang, Kou-Yuan, National Chiao Tung University, Hsinchu, Taiwan
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
head(onepetro_page_to_dataframe(my_url))
#>                                                                    title_data
#> 1                   Implicit Approximation of Neural Network and Applications
#> 2                Artificial Neural Networks Identify Restimulation Candidates
#> 3                                    Drill-Bit Diagnosis With Neural Networks
#> 4                 Neural Networks for Predictive Control of Drilling Dynamics
#> 5          An Artificial Neural Network Based Relative Permeability Predictor
#> 6 Characterize Submarine Channel Reservoirs: A Neural- Network-Based Approach
#>                   paper_id            source                    type
#> 1               114306-PA               SPE            Journal Paper
#> 2           0200-0044-JPT               SPE            Journal Paper
#> 3                19558-PA               SPE            Journal Paper
#> 4           1099-0036-JPT               SPE            Journal Paper
#> 5                03-04-02            PETSOC            Journal Paper
#> 6           0802-0046-JPT               SPE            Journal Paper
#>               year
#> 1             2009
#> 2             2000
#> 3             1990
#> 4             1999
#> 5             2003
#> 6             2002
#>                                                 author1_data
#> 1 Li, Dao-lun, University of Science and Technology of China
#> 2                      Denney, Dennis, JPT Technology Editor
#> 3               Arehart, R.A., Exxon Production Research Co.
#> 4                      Denney, Dennis, JPT Technology Editor
#> 5                       Guler, B., Dell Computer Corporation
#> 6                      Denney, Dennis, JPT Technology Editor
```

Summaries
---------

``` r
library(petroOne)

my_url <- make_search_url(query = "well test", 
                          how = "all")

result <- read_onepetro(my_url)

head(summary_by_doctype(result))
#>               name value
#> 1          Chapter     8
#> 2 Conference paper  9298
#> 3          General   193
#> 4    Journal paper  2529
#> 5            Media     5
#> 6            Other     8
head(summary_by_publisher(result))
#>                                            name value
#> 1                  American Petroleum Institute    42
#> 2           American Rock Mechanics Association    64
#> 3                                     BHR Group    10
#> 4       Carbon Management Technology Conference     1
#> 5 International Petroleum Technology Conference   364
#> 6      International Society for Rock Mechanics    39
head(summary_by_dates(result))
#>         name value
#> 1 Since 2017   347
#> 2 Since 2016   913
#> 3 Since 2015  1462
#> 4 Since 2014  2019
#> 5 Since 2013  2530
#> 6 Since 2012  3044
head(summary_by_publications(result))
#>                                                                name value
#> 1           10th North American Conference on Multiphase Technology     1
#> 2                                     10th World Petroleum Congress     1
#> 3                                                11th ISRM Congress     1
#> 4                                     11th World Petroleum Congress     4
#> 5                                                12th ISRM Congress     1
#> 6 12th International Conference on Multiphase Production Technology     2
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
head(onepetro_page_to_dataframe(htm_1))
#>                                                    title_data
#> 1                         Deconvolution Using Neural Networks
#> 2                                     Neural Networks And AVO
#> 3                    Neural Network Stacking Velocity Picking
#> 4                   First Break Picking Using Neural Networks
#> 5            Neural Networks And Paper Seismic Interpretation
#> 6 Seismic Principal Components Analysis Using Neural Networks
#>               paper_id         source                       type
#> 1           1996-1611            SEG            Conference Paper
#> 2           2002-0229            SEG            Conference Paper
#> 3           1992-0018            SEG            Conference Paper
#> 4           1990-0370            SEG            Conference Paper
#> 5           1995-0142            SEG            Conference Paper
#> 6           1996-1259            SEG            Conference Paper
#>               year
#> 1             1996
#> 2             2002
#> 3             1992
#> 4             1990
#> 5             1995
#> 6             1996
#>                                                       author1_data
#> 1                        Essenreiter, Robert, Karlsruhe University
#> 2           Russell, Brian, Hampson-Russell Software Services Ltd.
#> 3                              Schmidt, Jumndyr, Petrobras, Brazil
#> 4                               Wagner, D.E., Amoco Production Co.
#> 5                                  Leggett, Miles, British Gas plc
#> 6 Huang, Kou-Yuan, National Chiao Tung University, Hsinchu, Taiwan
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
head(onepetro_page_to_dataframe(htm_2))
#>                                                                                                                 title_data
#> 1                        Pore Pressure Prediction Using High Resolution Velocity And Acoustic Impedance In a Complex Field
#> 2                                       Single Gas Flow Prediction through Chokes using Artificial Intelligence Techniques
#> 3 A Production Performance Prediction and Field Development Tool for Coalbed Methane Reservoirs: A Proxy Modeling Approach
#> 4                                                Rock Mechanical Properties of Shallow Unconsolidated Sandstone Formations
#> 5                                      Challenges in Using Operational Data for Reliable Wind Turbine Condition Monitoring
#> 6                                                          Production Optimization Strategy Using Hybrid Genetic Algorithm
#>               paper_id           source                       type
#> 1           162204-MS              SPE            Conference Paper
#> 2           177991-MS              SPE            Conference Paper
#> 3           169588-MS              SPE            Conference Paper
#> 4           180803-MS              SPE            Conference Paper
#> 5            I-17-470            ISOPE            Conference Paper
#> 6           177442-MS              SPE            Conference Paper
#>               year
#> 1             2012
#> 2             2015
#> 3             2014
#> 4             2016
#> 5             2017
#> 6             2015
#>                                                       author1_data
#> 1                            Thakur, Ram Kumar, Kuwait Gulf Oil Co
#> 2 Elhaj, Murtada A., King Fahad University of Petroleum & Minerals
#> 3                   Rajput, Vaibhav, Pennsylvania State University
#> 4                                  Ramcharitar, Kamlesh, Petrotrin
#> 5                   Tautz-Weinert, Jannis, Loughborough University
#> 6              Salam, Damian Dion, Bandung Institute of Technology
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
head(onepetro_page_to_dataframe(htm_3))
#>                                                                                                          title_data
#> 1                                       Cyclic Behavior of Laterally Loaded Piles in Soils With Variable Properties
#> 2               A New Approach to Predict Failure Parameters of Carbonate Rocks using Artificial Intelligence Tools
#> 3 Seismic to Simulation Fracture Characterization of a Green Carbonate Reservoir in Presence of Large Uncertainties
#> 4                                                                                 Advanced Streaming Data Cleansing
#> 5                                                      Wave Height Forecast Using Self-Organization Algorithm Model
#> 6                                                The Role Of Ocean Engineers In Japanese Ocean Measurement Research
#>               paper_id           source                       type
#> 1            I-13-199            ISOPE            Conference Paper
#> 2           187974-MS              SPE            Conference Paper
#> 3           136829-MS              SPE            Conference Paper
#> 4           163702-MS              SPE            Conference Paper
#> 5            I-09-151            ISOPE            Conference Paper
#> 6            I-91-161            ISOPE            Conference Paper
#>               year
#> 1             2013
#> 2             2017
#> 3             2010
#> 4             2013
#> 5             2009
#> 6             1991
#>                                                                                                             author1_data
#> 1                                                           Depina, Ivan, Norwegian University of Science and Technology
#> 2                                                           Tariq, Zeeshan, King Fahd University of Petroleum & Minerals
#> 3                                                                                      Astratti, Donatella, Schlumberger
#> 4                                                                     Zheng, Yingying, University of Southern California
#> 5 Tsai, Tsung-Min, Department of Hydraulics and Ocean Engineering, National Cheng Kung University, Tainan, TAIWAN, China
#> 6                                              Koterayama, Wataru, Research Inst. for Appl. Mechanics, Kyushu University
```
