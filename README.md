
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
**tidyUSDA** provides the R user with a consistent API to pull USDA census and survey data from Quickstats. 

* `getQuickstat()` lets you pass values to the fields you see on the QuickStats website, as well as include a simple features (SF) geometry field for the county or state level. 

* `View({parameter name})` lets you view QuickStats all available values for a given field (which you would input into getQuickstats(), preferably with copy paste)

* `plotUSDA()` provides a quick way to plot your data if you set geometry = TRUE

## Installation
```
# Install directly from CRAN:
install.packages("tidyUSDA")
```

### Dependencies
Depending on which operating system you are installing tidyUSDA on, you may need to add external dependencies.

Please see the 'Installation' section on the [sf package homepage](https://r-spatial.github.io/sf/) for details.

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
