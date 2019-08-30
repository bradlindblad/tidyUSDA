
# tidyUSDA <a href='https://github.com/bradlindblad/tidyusda'><img src='/images/tidyusda.png' align="right" height="180" /></a>
*Note that this is a pre-release, development package currently*
 <!-- badges: start -->
  [![Travis build status](https://travis-ci.com/bradlindblad/tidyusda.svg?branch=master)](https://travis-ci.com/bradlindblad/tidyusda)
  <!-- badges: end -->
  
**tidyUSDA**, an interface to USDA Quick Stats data with mapping capabilities.


## Overview
**tidyUSDA** provides the R user with a consistent API to pull USDA census and survey data from [QuickStats](https://quickstats.nass.usda.gov/). You can:    
* ```getQuickstat()``` lets you pass values to the fields you see on the QuickStats website, as well as include a simple features (SF) geometry field for the county or state level. 
* ```getAll{paramname}``` lets you query QuickStats to find all available values for a given field (which you would input into getQuickstats())

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



# Get all parameter names for the 'program' field
all.program <- tidyUSDA::getAllProgram(key)
View(all.program)



# Get crop totals for all states for 2017
all.crop <- getQuickstat(key = key,
                         program = 'SURVEY',
                         data_item = 'CROP TOTALS, (EXCL HORTICULTURE) - PRODUCTION, MEASURED IN $',
                         geographic_level = 'STATE',
                         year = '2017',
                         geometry = T,  # we want a simple features column
                         lower48 = T)  # we want data for the lower 48 states only
View(all.crop)



# Plot this data for each state
tidyUSDA::plotUSDA(df = all.crop, title = "This is a sweet viridis graph")
```
The last function returns this ggplot choropleth:    
<a href='https://github.com/bradlindblad/tidyusda'><img src='/images/choropleth.png' align="center"  />


## Contact
* [Brad Lindblad](https://github.com/bradlindblad)
