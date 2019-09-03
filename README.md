
# tidyUSDA <a href='https://github.com/bradlindblad/tidyusda'><img src='/images/tidyusda.png' align="right" height="200" /></a>
*Note that this is a pre-release, development package currently*
 <!-- badges: start -->
  [![Travis build status](https://travis-ci.com/bradlindblad/tidyusda.svg?branch=master)](https://travis-ci.com/bradlindblad/tidyusda)
  <!-- badges: end -->
  
**tidyUSDA**, an interface to USDA Quick Stats data with mapping capabilities.


## Overview
**tidyUSDA** provides the R user with a consistent API to pull USDA census and survey data from [QuickStats](https://quickstats.nass.usda.gov/). You can:    
* ```getQuickstat()``` lets you pass values to the fields you see on the QuickStats website, as well as include a simple features (SF) geometry field for the county or state level. 
* ```View({parameter name})``` lets you view QuickStats all available values for a given field (which you would input into getQuickstats(), preferably with copy paste)
* ```plotUSDA()``` provides a quick way to plot your data if you set geometry = TRUE

## Installation
```
# Install directly from CRAN:
install.packages("tidyUSDA")
```

## Usage
You first need to grab a free API token from the USDA at [their website](https://quickstats.nass.usda.gov/api).    

```
library(tidyUSDA)

# Save your API token to a variable, or better yet, use the keyring package to store it securely
key <- '1234-abcd'



# View all parameter names for the 'program' field
View(allProgram)



# Get count of operations with sales in 2017
ops.with.sales <- getQuickstat(
  sector=NULL,
  group=NULL,
  commodity=NULL,
  category=NULL,
  domain=NULL,
  county=NULL,
  key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
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
<a href='https://github.com/bradlindblad/tidyusda'><img src='/images/choropleth.png' align="center"  />


## Contact
* [Brad Lindblad](https://github.com/bradlindblad)
