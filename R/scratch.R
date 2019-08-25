
beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key=7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71"

param1 <- '&source_desc=CENSUS'
param2 <- '&sector_desc=ANIMALS & PRODUCTS'
param3 <- '&group_desc=POULTRY'
param4 <- '&commodity_desc=CHICKENS'
param6 <- '&statisticcat_desc=INVENTORY'
param7 <- '&short_desc=CHICKENS - INVENTORY'
param8 <- '&domain_desc=TOTAL'
param9 <- '&agg_level_desc=NATIONAL'
param10 <- '&state_name=US TOTAL'
param11 <- '&county_name=BILLINGS'
param12 <- '&year=2007'


end <- '&format=json'

url <- paste0(beginning, param1, param2, param3, param4, param6, param7, param8, param9, param10)

raw <- jsonlite::fromJSON(url)
raw <- raw$data
# 

new <-  "http://quickstats.nass.usda.gov/api/get_param_values/?key=7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71&param=group_desc&format=csv"
newraw <- jsonlite::fromJSON(new)
newraw
class(newraw)

mydata <- unlist(newraw)
class(mydata)


u <- 'http://quickstats.nass.usda.gov/api/api_GET/?key=7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71&commodity_desc=CORN&year__GE=2012&state_alpha=VA&format=JSON'
newraw <- jsonlite::fromJSON(u)
newraw
