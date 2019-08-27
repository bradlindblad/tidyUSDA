# IN PROGRESS

library(jsonlite)
library(tidyverse)
library(rgeos)
library(tigris)
library(sf)


getQuickstat <- function(key=NULL,program=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, data_item=NULL, domain=NULL, geographic_level=NULL,
                         region=NULL, state=NULL, county=NULL, year=NULL, geometry = FALSE) {
  
  # Gets operator count by state
  #
  # Args:
  #   state = string of state ex: 'ND'
  #   
  # Returns:
  #   data frame with state, year, county and count of operators
  #    Note: there will be multiple years' data
  #
  # api.key = 7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71
  #
  # quickstats URL: https://quickstats.nass.usda.gov
  #
  
  # states <- data.frame(fips = c('27', '38', '55'), state = c('MN', 'ND', 'WI'))
  # fips <- filter(states, state == input)[,1] %>%
  #   as.character()
  
  beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key=7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71"
  
  param1 <- '&source_desc=CENSUS'
  param2 <- '&sector_desc=CROPS'
  param3 <- '&group_desc=CROP TOTALS'
  param4 <- '&commodity_desc=CROP TOTALS'
  param6 <- '&statisticcat_desc=PRODUCTION'
  param7 <- '&short_desc=CROP TOTALS, PRODUCTION CONTRACT - OPERATIONS WITH PRODUCTION'
  param8 <- '&domain_desc=TOTAL'
  param9 <- '&agg_level_desc=COUNTY'
  param10 <- '&state_name=MINNESOTA'
  param11 <- '&county_name=BROWN'
  
  
  params <- c(beginning, param1, param2, param3, param4, param6, param7, param8, param9, param10, param11)
  
  
  
  
  url <- paste0(params, collapse = ",")
  url <- gsub(",&", "&", url)
  url <- gsub(" ", "%20", url)
  
  raw <- jsonlite::fromJSON(url)
  raw <- raw$data
  

  if(geometry){
    # STATE ------------------------------------------------------------------
    if(stringr::str_detect(param9, "STATE")){   # if state is not null and county is null, then do this
    geoms <- tigris::states()
    
    combined <- tigris::geo_join(spatial_data = geoms,
                                 data_frame = raw,
                                 by_sp = 'STATEFP',
                                 by_df = 'state_fips_code',
                                 how = 'inner')
    
    mydata <- sf::st_as_sf(combined)
    }
  
  
  # COUNTY ------------------------------------------------------------------
    if(stringr::str_detect(param9, "COUNTY")){  # if county is not null, then do this
      geoms <- tigris::counties()
      geoms@data$COUNTYKEY <- paste0(geoms@data$STATEFP, geoms@data$COUNTYFP)
      
      
      raw$COUNTYKEY <- paste0(raw$state_ansi, raw$county_code)
      
      combined <- tigris::geo_join(spatial_data = geoms,
                                   data_frame = raw,
                                   by_sp = 'COUNTYKEY',
                                   by_df = 'COUNTYKEY',
                                   how = 'inner')
      
      mydata <- sf::st_as_sf(combined)
    }
    
    # ggplot(mydat) +
    #   geom_sf(aes(fill = mydat$Value)) +
    #   theme_minimal() +
    #   scale_fill_viridis_d() +
    #   theme(legend.position = 'NONE')
    
    plot(mydata)
  }
  return(mydata)
  
}
  
