#!/usr/bin/R
# getQuickstat.R

getQuickstat <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, domain=NULL, geographic_level=NULL,
                         state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE) {
  
  #' getQuickstat
  #' @description 
  #' Get values from Quickstats in a dataframe or data frame
  #' with sf:: geometry field
  #' @param key your USDA api key. Get one at https://quickstats.nass.usda.gov/api - string
  #' @param program program field - string
  #' @param data_item data_item field - string
  #' @param sector sector field - string
  #' @param group group field - string
  #' @param commodity commodity field - string
  #' @param category category field - string
  #' @param domain domain field - string
  #' @param geographic_level geographic_level field - string
  #' @param state state field - either a string or character vector with multiple states
  #' @param county county field - either a string or character vector with multiple states
  #' @param year year field - string
  #' @param geometry geometry field (TRUE or FALSE), set to TRUE if you would like a simple features (SF) geometry field included. 
  #' Only works when geographic_level is set to 'COUNTY' or 'STATE'
  #' @param lower48 limit data to the lower 48 states? - TRUE or FALSE
  #' @export
  #' 
  #' 
  #' @note  
  #'Go to the webpage https://quickstats.nass.usda.gov/. As a best practice, select the items in these fields and test that that data item 
  #'    exists in the browser before using those parameters in this function. When you have a dataset that works, enter those values in the 
  #'    function as parameters. Ideally, only enter values for your key obviously, then PROGRAM, DATA_ITEM, GEOGRAPHIC_LEVEL and then if
  #'    necessary, DOMAIN, STATE, COUNTY or YEAR. 
  #' 

  # beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key="
  

# Functions to handle vectors vs. single values ---------------------------
  # Function to call API from input params
  defaultCallAPI <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                          category=NULL, domain=NULL, geographic_level=NULL,
                          state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE){
    
    
    beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key="
    
    
    
    if(exists("program") & !is.null(program)){param1 <- paste0('&source_desc=', toupper(program))}else{param1 <- NULL}
    if(exists("sector") & !is.null(sector)){param2 <- paste0('&sector_desc=', toupper(sector))}else{param2 <- NULL}
    if(exists("group") & !is.null(group)){param3 <- paste0('&group_desc=', toupper(group))}else{param3 <- NULL}
    if(exists("commodity") & !is.null(commodity)){param4 <- paste0('&commodity_desc=', toupper(commodity))}else{param4 <- NULL}
    if(exists("category") & !is.null(category)){param6 <- paste0('&statisticcat_desc=', toupper(category))}else{param6 <- NULL}
    if(exists("data_item") & !is.null(data_item)){param7 <- paste0('&short_desc=', toupper(data_item))}else{param7 <- NULL}
    if(exists("domain") & !is.null(domain)){param8 <- paste0('&domain_desc=', toupper(domain))}else{param8 <- NULL}
    if(exists("geographic_level") & !is.null(geographic_level)){param9 <- paste0('&agg_level_desc=', toupper(geographic_level))}else{param9 <- NULL}
    if(exists("state") & !is.null(state)){param10 <- paste0('&state_name=', toupper(state))}else{param10 <- NULL}
    if(exists("county") & !is.null(county)){param11 <- paste0('&county_name=', toupper(county))}else{param11 <- NULL}
    if(exists("year") & !is.null(year)){param12 <- paste0('&year=', toupper(year))}else{param12 <- NULL}
    
    
    params <- c(beginning, key, param1, param2, param3, param4, param6, param7, param8, param9, param10, param11, param12)
    
    
    
    
    url <- paste0(params, collapse = ",")
    url <- gsub(",&", "&", url)
    url <- gsub("=,", "=", url)
    url <- gsub(" ", "%20", url)
    
    raw <- jsonlite::fromJSON(url)
    raw <- raw$data
    mydata <- raw
    return(mydata)
    
  }
  
  # Function to call API from input params with multiple states
  multStates <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, domain=NULL, geographic_level=NULL,
                         state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE){
    
    beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key="
    
    # Handle multiple states
    # anon fn to work with next items
    anon.states <- function(x){paste0("&state_name=", x)}
    
    if(length(state) > 1){
      
      state.concat <- lapply(state, anon.states)
      
      
    }
    
    # Handle multiple states
    
    
    if(exists("program") & !is.null(program)){param1 <- paste0('&source_desc=', toupper(program))}else{param1 <- NULL}
    if(exists("sector") & !is.null(sector)){param2 <- paste0('&sector_desc=', toupper(sector))}else{param2 <- NULL}
    if(exists("group") & !is.null(group)){param3 <- paste0('&group_desc=', toupper(group))}else{param3 <- NULL}
    if(exists("commodity") & !is.null(commodity)){param4 <- paste0('&commodity_desc=', toupper(commodity))}else{param4 <- NULL}
    if(exists("category") & !is.null(category)){param6 <- paste0('&statisticcat_desc=', toupper(category))}else{param6 <- NULL}
    if(exists("data_item") & !is.null(data_item)){param7 <- paste0('&short_desc=', toupper(data_item))}else{param7 <- NULL}
    if(exists("domain") & !is.null(domain)){param8 <- paste0('&domain_desc=', toupper(domain))}else{param8 <- NULL}
    if(exists("geographic_level") & !is.null(geographic_level)){param9 <- paste0('&agg_level_desc=', toupper(geographic_level))}else{param9 <- NULL}
    # if(exists("state") & !is.null(state)){param10 <- paste0('&state_name=', toupper(state))}else{param10 <- NULL}
    if(exists("county") & !is.null(county)){param11 <- paste0('&county_name=', toupper(county))}else{param11 <- NULL}
    if(exists("year") & !is.null(year)){param12 <- paste0('&year=', toupper(year))}else{param12 <- NULL}
    
    
    params <- c(beginning, key, param1, param2, param3, param4, param6, param7, param8, param9, state.concat, param11, param12)
    
    params <- unlist(params)
    
    
    url <- paste0(params, collapse = " ")
    url <- gsub("= ", "=", url)
    url <- gsub(" &", "&", url)
    url <- gsub("=,", "=", url)
    url <- gsub(" ", "%20", url)
    
    raw <- jsonlite::fromJSON(url)
    raw <- raw$data
    mydata <- raw
    return(mydata)
    
  }
  
  # Function to call API from input params with multiple counties
  multCounties <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, domain=NULL, geographic_level=NULL,
                         state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE){
    
    beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key="
    
    # Handle multiple counties
    # anon fn to work with next items
    anon.counties <- function(x){paste0("&county_name=", x)}
    
    if(length(county) > 1){
      
      county.concat <- lapply(county, anon.counties)
      
      
    }
    
    # Handle multiple counties
    
    
    if(exists("program") & !is.null(program)){param1 <- paste0('&source_desc=', toupper(program))}else{param1 <- NULL}
    if(exists("sector") & !is.null(sector)){param2 <- paste0('&sector_desc=', toupper(sector))}else{param2 <- NULL}
    if(exists("group") & !is.null(group)){param3 <- paste0('&group_desc=', toupper(group))}else{param3 <- NULL}
    if(exists("commodity") & !is.null(commodity)){param4 <- paste0('&commodity_desc=', toupper(commodity))}else{param4 <- NULL}
    if(exists("category") & !is.null(category)){param6 <- paste0('&statisticcat_desc=', toupper(category))}else{param6 <- NULL}
    if(exists("data_item") & !is.null(data_item)){param7 <- paste0('&short_desc=', toupper(data_item))}else{param7 <- NULL}
    if(exists("domain") & !is.null(domain)){param8 <- paste0('&domain_desc=', toupper(domain))}else{param8 <- NULL}
    if(exists("geographic_level") & !is.null(geographic_level)){param9 <- paste0('&agg_level_desc=', toupper(geographic_level))}else{param9 <- NULL}
    if(exists("state") & !is.null(state)){param10 <- paste0('&state_name=', toupper(state))}else{param10 <- NULL}
    # if(exists("county") & !is.null(county)){param11 <- paste0('&county_name=', toupper(county))}else{param11 <- NULL}
    if(exists("year") & !is.null(year)){param12 <- paste0('&year=', toupper(year))}else{param12 <- NULL}
    
    
    params <- c(beginning, key, param1, param2, param3, param4, param6, param7, param8, param9, param10, county.concat, param12)
    
    params <- unlist(params)
    
    
    url <- paste0(params, collapse = " ")
    url <- gsub("= ", "=", url)
    url <- gsub(" &", "&", url)
    url <- gsub("=,", "=", url)
    url <- gsub(" ", "%20", url)
    
    raw <- jsonlite::fromJSON(url)
    raw <- raw$data
    mydata <- raw
    return(mydata)
    
  }
  
  # Function to call API from input params with multiple counties and multiple states
  multStatesandCounties <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, domain=NULL, geographic_level=NULL,
                         state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE){
    
    beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key="
    
    # Handle multiple counties
    # anon fn to work with next items
    anon.counties <- function(x){paste0("&county_name=", x)}
    
    if(length(county) > 1){
      
      county.concat <- lapply(county, anon.counties)
      
      
    }
    
    # Handle multiple states
    # anon fn to work with next items
    anon.states <- function(x){paste0("&state_name=", x)}
    
    if(length(state) > 1){
      print("k")
      state.concat <- lapply(state, anon.states)
      
      
    }
    
    # Handle multiple counties
    
    
    if(exists("program") & !is.null(program)){param1 <- paste0('&source_desc=', toupper(program))}else{param1 <- NULL}
    if(exists("sector") & !is.null(sector)){param2 <- paste0('&sector_desc=', toupper(sector))}else{param2 <- NULL}
    if(exists("group") & !is.null(group)){param3 <- paste0('&group_desc=', toupper(group))}else{param3 <- NULL}
    if(exists("commodity") & !is.null(commodity)){param4 <- paste0('&commodity_desc=', toupper(commodity))}else{param4 <- NULL}
    if(exists("category") & !is.null(category)){param6 <- paste0('&statisticcat_desc=', toupper(category))}else{param6 <- NULL}
    if(exists("data_item") & !is.null(data_item)){param7 <- paste0('&short_desc=', toupper(data_item))}else{param7 <- NULL}
    if(exists("domain") & !is.null(domain)){param8 <- paste0('&domain_desc=', toupper(domain))}else{param8 <- NULL}
    if(exists("geographic_level") & !is.null(geographic_level)){param9 <- paste0('&agg_level_desc=', toupper(geographic_level))}else{param9 <- NULL}
    # if(exists("state") & !is.null(state)){param10 <- paste0('&state_name=', toupper(state))}else{param10 <- NULL}
    # if(exists("county") & !is.null(county)){param11 <- paste0('&county_name=', toupper(county))}else{param11 <- NULL}
    if(exists("year") & !is.null(year)){param12 <- paste0('&year=', toupper(year))}else{param12 <- NULL}
    
    
    params <- c(beginning, key, param1, param2, param3, param4, param6, param7, param8, param9, state.concat, county.concat, param12)
    
    params <- unlist(params)
    
    
    url <- paste0(params, collapse = " ")
    url <- gsub("= ", "=", url)
    url <- gsub(" &", "&", url)
    url <- gsub("=,", "=", url)
    url <- gsub(" ", "%20", url)
    
    raw <- jsonlite::fromJSON(url)
    raw <- raw$data
    mydata <- raw
    return(mydata)
    
  }
  
  

# Logic to handle vectors vs. single values -------------------------------------
 
  mult.state <- ifelse(length(state) > 1, mult.state <- TRUE, mult.state <- FALSE)
  mult.county <- ifelse(length(county) > 1, mult.county <- TRUE, mult.county <- FALSE)
  
  # Multiple state and multiple county
  if(mult.state & mult.county){
    mydata <- multStatesandCounties(key=key, program=program, data_item=data_item, sector=sector, group=group, commodity=commodity,
                          category=category, domain=domain, geographic_level=geographic_level,
                          state=state, county=county, year=year, geometry = geometry, lower48 = lower48)
  }
  
  # Multiple State 
  if(mult.state & mult.county == FALSE){
    mydata <- multStates(key=key, program=program, data_item=data_item, sector=sector, group=group, commodity=commodity,
               category=category, domain=domain, geographic_level=geographic_level,
               state=state, county=county, year=year, geometry = geometry, lower48 = lower48)
  }
  
  # Multiple county
  if(mult.county & mult.state == FALSE){
    mydata <- multCounties(key=key, program=program, data_item=data_item, sector=sector, group=group, commodity=commodity,
               category=category, domain=domain, geographic_level=geographic_level,
               state=state, county=county, year=year, geometry = geometry, lower48 = lower48)
  }
  
  # Default
  if(mult.county == FALSE & mult.state == FALSE){
    mydata <- defaultCallAPI(key=key, program=program, data_item=data_item, sector=sector, group=group, commodity=commodity,
                 category=category, domain=domain, geographic_level=geographic_level,
                 state=state, county=county, year=year, geometry = geometry, lower48 = lower48)
  }
  
  # Reset variables to a default value if not used
  # if(is.null(program)){program <- 'NON'}
  # if(is.null(sector)){sector <- 'NON'}
  # if(is.null(group)){group <- 'NON'}
  # if(is.null(commodity)){commodity <- 'NON'}
  # if(is.null(category)){category <- 'NON'}
  # if(is.null(data_item)){data_item <- 'NON'}
  # if(is.null(domain)){domain <- 'NON'}
  if(is.null(geographic_level)){geographic_level <- 'NON'}
  # if(is.null(state)){state <- 'NON'}
  # if(is.null(county)){county <- 'NON'}
  # if(is.null(year)){year <- 'NON'} 
  # 
  
  # STATE
  if(geometry & geographic_level == 'STATE'){
    geoms <- tigris::states()
    
    #options(tigris_use_cache = TRUE)
    
    combined <- tigris::geo_join(spatial_data = geoms,
                                 data_frame = mydata,
                                 by_sp = 'STATEFP',
                                 by_df = 'state_fips_code',
                                 how = 'inner')
    
    mydata <- sf::st_as_sf(combined)
    
    if(lower48){mydata <- dplyr::filter(mydata, !(toupper(mydata$state_name) %in% c("ALASKA", "HAWAII", "PUERTO RICO")))}
  }
  
  # COUNTY
  if(geometry & geographic_level == 'COUNTY'){
    
    #options(tigris_use_cache = TRUE)
    geoms <- tigris::counties()
    geoms@data$COUNTYKEY <- paste0(geoms@data$STATEFP, geoms@data$COUNTYFP)
    
    
    mydata$COUNTYKEY <- paste0(mydata$state_ansi, mydata$county_code)
    
    combined <- tigris::geo_join(spatial_data = geoms,
                                 data_frame = mydata,
                                 by_sp = 'COUNTYKEY',
                                 by_df = 'COUNTYKEY',
                                 how = 'inner')
    
    mydata <- sf::st_as_sf(combined)
    
    if(lower48){mydata <- dplyr::filter(mydata, !(toupper(mydata$state_name) %in% c("ALASKA", "HAWAII", "PUERTO RICO")))}
    
  }
  
  
  return(mydata)
  print("Success")
}
  

