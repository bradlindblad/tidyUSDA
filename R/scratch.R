
beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key=7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71"

param1 <- '&source_desc=CENSUS'
param2 <- '&sector_desc=CROPS'
param3 <- '&group_desc=CROP TOTALS'
param4 <- '&commodity_desc=CROP TOTALS'
param6 <- '&statisticcat_desc=PRODUCTION'
param7 <- '&short_desc=CROP TOTALS, PRODUCTION CONTRACT - OPERATIONS WITH PRODUCTION'
param8 <- '&domain_desc=TOTAL'
param9 <- '&agg_level_desc=STATE'
param10 <- '&state_name=US TOTAL'
param11 <- '&county_name=BILLINGS'
param12 <- '&year=2007'


end <- '&format=json'

url <- paste0(beginning, param1, param2, param3, param4, param6, param7, param8, param9)

raw <- jsonlite::fromJSON(url)
raw <- raw$data


# Test plotting with TIGRIS joining geoms ---------------------------------

library(rgeos)
library(tigris)
library(sf)

# get unique states
states <- unique(raw$state_fips_code)

geoms <- tigris::states()

combined <- tigris::geo_join(spatial_data = geoms, data_frame = raw, 'STATEFP', 'state_fips_code', how = 'inner')

mydat <- sf::st_as_sf(combined)

ggplot(mydat) +
  geom_sf(aes(fill = mydat$Value)) +
  theme_minimal() +
  scale_fill_viridis_d() +
  theme(legend.position = 'NONE')










# Get unique param vals ---------------------------------------------------

new <-  "http://quickstats.nass.usda.gov/api/get_param_values/?key=7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71&param=group_desc&format=csv"
newraw <- jsonlite::fromJSON(new)
newraw
class(newraw)

mydata <- unlist(newraw)
class(mydata)


