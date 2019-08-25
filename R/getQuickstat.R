library(jsonlite)
library(tidyverse)


getRichlandCornYield <- function() {
  
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
  
  param1 <- '&source_desc=SURVEY'
  param2 <- '&sector_desc=CROPS'
  param3 <- '&group_desc=FIELD CROPS'
  param4 <- '&commodity_desc=CORN'
  param6 <- '&statisticcat_desc=YIELD'
  param7 <- '&short_desc=CORN, GRAIN - YIELD, MEASURED IN BU / ACRE'
  param8 <- '&domain_desc=TOTAL'
  param9 <- '&agg_level_desc=COUNTY'
  param10 <- '&state_name=NORTH DAKOTA'
  param11 <- '&county_name=RICHLAND'
  
  
  end <- '&format=json'
  
  url <- paste0(beginning, param1, param2, param3, param4, param6, param7, param8, param9, param10, param11)
  
  raw <- jsonlite::fromJSON(url)
  raw <- raw$data
  # 
  # raw$state_name <- dplyr::recode(raw$state_name, "MINNESOTA" = "MN",
  #                                 "NORTH DAKOTA" = "ND",
  #                                 "WISCONSIN" = "WI" )
  # 
  # mydata <- raw %>%
  #   dplyr::select(state_name, county_name, Value, year) 
  # 
  # mydata$year <- as.integer(mydata$year)
  # mydata$Value <- gsub(" ", "", mydata$Value)
  # mydata$Value <- gsub(",", "", mydata$Value)
  # mydata$Value <- as.numeric(mydata$Value)
  # mydata$county_name <- stringi::stri_trans_general(mydata$county_name, id = "Title")
  # 
  # mydata<- mydata %>%
  #   dplyr::mutate(key = paste0(county_name, ";", state_name))
  # 
  return(raw)
  
}

bro <- getRichlandCornYield()

bro

write.csv(bro, "C:\\users\\lindblb\\desktop\\richland_corn_yield.csv")


getRichlandSoyYield <- function() {
  
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
  
  param1 <- '&source_desc=SURVEY'
  param2 <- '&sector_desc=CROPS'
  param3 <- '&group_desc=FIELD CROPS'
  param4 <- '&commodity_desc=SOYBEANS'
  param6 <- '&statisticcat_desc=YIELD'
  param7 <- '&short_desc=SOYBEANS - YIELD, MEASURED IN BU / ACRE'
  param8 <- '&domain_desc=TOTAL'
  param9 <- '&agg_level_desc=COUNTY'
  param10 <- '&state_name=NORTH DAKOTA'
  param11 <- '&county_name=RICHLAND'
  
  
  end <- '&format=json'
  
  url <- paste0(beginning, param1, param2, param3, param4, param6, param7, param8, param9, param10, param11)
  
  raw <- jsonlite::fromJSON(url)
  raw <- raw$data
  # 
  # raw$state_name <- dplyr::recode(raw$state_name, "MINNESOTA" = "MN",
  #                                 "NORTH DAKOTA" = "ND",
  #                                 "WISCONSIN" = "WI" )
  # 
  # mydata <- raw %>%
  #   dplyr::select(state_name, county_name, Value, year) 
  # 
  # mydata$year <- as.integer(mydata$year)
  # mydata$Value <- gsub(" ", "", mydata$Value)
  # mydata$Value <- gsub(",", "", mydata$Value)
  # mydata$Value <- as.numeric(mydata$Value)
  # mydata$county_name <- stringi::stri_trans_general(mydata$county_name, id = "Title")
  # 
  # mydata<- mydata %>%
  #   dplyr::mutate(key = paste0(county_name, ";", state_name))
  # 
  return(raw)
  
}

bros <- getRichlandSoyYield()

bros

write.csv(bros, "C:\\users\\lindblb\\desktop\\richland_soy_yield.csv")