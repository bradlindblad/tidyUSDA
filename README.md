
# tidyUSDA <img src='https://raw.githubusercontent.com/bradlindblad/tidyUSDA/master/images/tidyusda.png' align="right" height="200" />

[![R build status](https://github.com/bradlindblad/tidyUSDA/workflows/R-CMD-check/badge.svg)](https://github.com/bradlindblad/tidyUSDA/actions)
[![pkgdown](https://github.com/bradlindblad/tidyUSDA/actions/workflows/pkgdown.yaml/badge.svg?branch=master)](https://github.com/bradlindblad/tidyUSDA/actions/workflows/pkgdown.yaml)
[![Codecov test coverage](https://codecov.io/gh/bradlindblad/tidyusda/branch/master/graph/badge.svg)](https://app.codecov.io/gh/bradlindblad/tidyusda?branch=master)
[![metacran downloads](https://cranlogs.r-pkg.org/badges/grand-total/tidyUSDA)](https://cran.r-project.org/package=tidyUSDA)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![CRAN status](https://www.r-pkg.org/badges/version/tidyUSDA)](https://CRAN.R-project.org/package=tidyUSDA)
[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6.1-6666ff.svg)](https://cran.r-project.org/)



**tidyUSDA**, an interface to USDA Quick Stats data with mapping capabilities.


## Overview
**tidyUSDA** provides the R user with a consistent API to pull USDA census and survey data from Quickstats. You can:    
* ```getQuickstat()``` lets you pass values to the fields you see on the QuickStats website, as well as include a simple features (SF) geometry field for the county or state level. 
* ```View({parameter name})``` lets you view QuickStats all available values for a given field (which you would input into getQuickstats(), preferably with copy paste)
* ```plotUSDA()``` provides a quick way to plot your data if you set geometry = TRUE

## Installation
```
# Install directly from CRAN:
install.packages("tidyUSDA")
```
### Windows
Depending on which version of R you have installed, you may need to install [Rtools](https://cran.r-project.org/bin/windows/Rtools/).

### Mac
You may need to install gdal before install.packages("tidyUSDA"). Use these commands:    
```
brew install pkg-config     
brew install gdal
```
### Linux
You will need to install  GDAL (>= 2.0.1), GEOS (>= 3.4.0) and Proj.4 (>= 4.8.0) for most Unix-based systems.

#### Ubuntu
To install the dependencies on Ubuntu, either add ubuntugis-unstable to the package repositories:
```
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get update
sudo apt-get install libudunits2-dev libgdal-dev libgeos-dev libproj-dev 
```
or install dependencies from source; see e.g. an older travis config file for hints.

#### Fedora
The following command installs all required dependencies:
```
sudo dnf install gdal-devel proj-devel proj-epsg proj-nad geos-devel udunits2-devel
```
#### Arch
Get gdal, proj and geos from the main repos and udunits from the AUR:
```
pacman -S gdal proj geos
pacaur/yaourt/whatever -S udunits
```
*Thanks to the [SF package README](https://github.com/r-spatial/sf) for these OS helpers.*
## Usage

Check out the vignette with:
```
vignette("using_tidyusda")
```

You first need to grab a free API token from the USDA at their Quickstats website.    

```
library(tidyUSDA)

# Save your API token to a variable, or better yet, use the keyring package to store it securely
key <- '1234-abcd'



# View all parameter names for the 'program' field
View(tidyUSDA::allProgram)



# Get count of operations with sales in 2017
ops.with.sales <- tidyUSDA::getQuickstat(
  sector=NULL,
  group=NULL,
  commodity=NULL,
  category=NULL,
  domain=NULL,
  county=NULL,
  key = key,
  program = 'CENSUS',
  data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
  geographic_level = 'COUNTY',
  year = '2017',
  state = NULL,
  geometry = T,
  lower48 = T)



# Plot this data for each state
tidyUSDA::plotUSDA(df = ops.with.sales)
```
The last function returns this ggplot choropleth:    
<img src='https://github.com/bradlindblad/tidyUSDA/blob/master/images/choropleth.png?raw=true' align="center"  />


## Contact
* [Brad Lindblad](https://github.com/bradlindblad)

***This product uses the NASS API but is not endorsed or certified by NASS.***
