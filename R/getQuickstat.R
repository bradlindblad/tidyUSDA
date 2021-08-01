#!/usr/bin/R
# getQuickstat.R


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
  
 
  call_api <- function(url) {
    httr::set_config(httr::config(ssl_verifypeer = 0L))
    resp <- httr::GET(url = url)
    jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
    
    
    raw <- jsonlite::fromJSON(jsonRespText)
    raw <- raw$data
    return(raw)
  }
  try_call_api <- purrr::possibly(.f = call_api, otherwise = "Error - USDA not available; try in a few mins.")
  mydata <- try_call_api(url)
  # 
  # httr::set_config(httr::config(ssl_verifypeer = 0L))
  # resp <- httr::GET(url = url)
  # jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
  # 
  # 
  # raw <- jsonlite::fromJSON(jsonRespText)
  # raw <- raw$data
  # mydata <- raw
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
  
  call_api <- function(url) {
    httr::set_config(httr::config(ssl_verifypeer = 0L))
    resp <- httr::GET(url = url)
    jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
    
    
    raw <- jsonlite::fromJSON(jsonRespText)
    raw <- raw$data
    return(raw)
  }
  try_call_api <- purrr::possibly(.f = call_api, otherwise = "Error - USDA not available; try in a few mins.")
  mydata <- try_call_api(url)
  # 
  # httr::set_config(httr::config(ssl_verifypeer = 0L))
  # resp <- httr::GET(url = url)
  # jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
  # 
  # 
  # raw <- jsonlite::fromJSON(jsonRespText)
  # raw <- raw$data
  # mydata <- raw
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
  
  call_api <- function(url) {
    httr::set_config(httr::config(ssl_verifypeer = 0L))
    resp <- httr::GET(url = url)
    jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
    
    
    raw <- jsonlite::fromJSON(jsonRespText)
    raw <- raw$data
    return(raw)
  }
  try_call_api <- purrr::possibly(.f = call_api, otherwise = "Error - USDA not available; try in a few mins.")
  mydata <- try_call_api(url)
  # 
  # httr::set_config(httr::config(ssl_verifypeer = 0L))
  # resp <- httr::GET(url = url)
  # jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
  # 
  # 
  # raw <- jsonlite::fromJSON(jsonRespText)
  # raw <- raw$data
  # mydata <- raw
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
  
  call_api <- function(url) {
    httr::set_config(httr::config(ssl_verifypeer = 0L))
    resp <- httr::GET(url = url)
    jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
    
    
    raw <- jsonlite::fromJSON(jsonRespText)
    raw <- raw$data
    return(raw)
  }
  try_call_api <- purrr::possibly(.f = call_api, otherwise = "Error - USDA not available; try in a few mins.")
  mydata <- try_call_api(url)
  # 
  # httr::set_config(httr::config(ssl_verifypeer = 0L))
  # resp <- httr::GET(url = url)
  # jsonRespText <- httr::content(resp,as="text", encoding = "UTF-8") 
  # 
  # 
  # raw <- jsonlite::fromJSON(jsonRespText)
  # raw <- raw$data
  # mydata <- raw
  return(mydata)
  
}



# Fuzzy match function ----------------------------------------------------

fuzzyMatch <- function(input, dataset){  
  if(!is.null(input) & !input %in% dataset){
    matcheddf <- dataset
    matcheddf <- data.frame(index = seq(1, length(matcheddf),1), text = matcheddf)
    fuzzydf <- fuzzyjoin::stringdist_join(matcheddf, data.frame(index = c(1), text = c(input)), by = c("index", "text"), max_dist = 6, distance_col = "dist")
    interim <- dplyr::arrange(fuzzydf, fuzzydf$text.dist)
    result <- as.character(interim[1,2])
  }
  return(result)
}
 

# getQuickstat ------------------------------------------------------------

#' getQuickstat
#' 
#' @description 
#' Get values from USDA Quick Stats in a dataframe
#' with optional sf (simple features) geometry field
#' 
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
#' @param weighted_by_area option to mutate a new column that takes the target ('Value') and divides it by the square miles in that state or county; only works when GEOMETRY = TRUE - TRUE or FALSE
#' @export
#' 
#' 
  # sector=NULL
  # group=NULL
  # commodity=NULL
  # category=NULL
  # domain='TOTAL'
  # county=NULL
  # key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'
  # program = 'CENSUS'
  # data_item = 'AG LAND, INCL BUILDINGS - ASSET VALUE, MEASURED IN $'
  # geographic_level = 'STATE'
  # year = NULL
  # state = NULL
  # geometry = T
  # lower48 = T
#' 
#' @note  
#'Go to the webpage https://quickstats.nass.usda.gov/. As a best practice, select the items in these fields and test that that data item 
#'    exists in the browser before using those parameters in this function. When you have a dataset that works, enter those values in the 
#'    function as parameters. Ideally, only enter values for your key obviously, then PROGRAM, DATA_ITEM, GEOGRAPHIC_LEVEL and then if
#'    necessary, DOMAIN, STATE, COUNTY or YEAR. 
#' 
#' @examples 
#' \dontrun{
#' getQuickstat(
#' key = 'your_key',
#' program = 'CENSUS',
#' data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
#' geographic_level = 'COUNTY',
#' domain = 'TOTAL',
#' year = '2017',
#' state = NULL,
#' geometry = T,
#' lower48 = T)
#' 
#' }

getQuickstat <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, domain=NULL, geographic_level=NULL,
                         state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE, weighted_by_area = FALSE) {
  # 
  # key <- '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'
  # sector=NULL
  # group=NULL
  # commodity=NULL
  # category=NULL
  # domain='TOTAL'
  # county=NULL
  # key = key
  # program = 'CENSUS'
  # data_item = 'CROP TOTALS - OPERATIONS WITH SALES'
  # geographic_level = 'STATE'
  # year = '2017'
  # state = NULL
  # geometry = TRUE
  # lower48 = TRUE
  # weighted_by_area = T
  


# Install rgeos if not already installed
if (!"rgeos" %in% utils::installed.packages()) {
  stop(crayon::cyan("Package \"rgeos\" needed for this function to work. Please install it with install.packages(\"rgeos\")"),
       call. = FALSE)
}

# Logic to handle improper inputs
  
  # Key
  if(is.null(key)){
    message(crayon::cyan("API key missing; enter an API key."))
  } 
  
  # Program
  if(is.null(program)){} else if(!toupper(program) %in% tidyUSDA::allProgram){
    recommendation <- crayon::red(fuzzyMatch(toupper(program), tidyUSDA::allProgram));
    message(crayon::cyan(paste0("Your value for PROGRAM is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allProgram for a vector of all acceptable values.")))
  }
  
  # Data item
  if(is.null(data_item)){} else if(!toupper(data_item) %in% tidyUSDA::allDataItem){
    recommendation <- crayon::red(fuzzyMatch(toupper(data_item), tidyUSDA::allDataItem));
    message(crayon::cyan(paste0("Your value for DATA_ITEM is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allDataItem for a vector of all acceptable values.")))
  }
  
  # Sector
  if(is.null(sector)){} else if (!is.null(sector) & !toupper(sector) %in% tidyUSDA::allSector){
    recommendation <- crayon::red(fuzzyMatch(toupper(sector), tidyUSDA::allSector));
    message(crayon::cyan(paste0("Your value for SECTOR is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allSector for a vector of all acceptable values.")))
  }

  # Group
  if(is.null(group)){} else if(!toupper(group) %in% tidyUSDA::allGroup){
    recommendation <- crayon::red(fuzzyMatch(toupper(group), tidyUSDA::allGroup));
    message(crayon::cyan(paste0("Your value for GROUP is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allGroup for a vector of all acceptable values.")))
  }
  
  # Commodity
  if(is.null(commodity)){} else if(!toupper(commodity) %in% tidyUSDA::allCommodity){
    recommendation <- crayon::red(fuzzyMatch(toupper(commodity), tidyUSDA::allCommodity));
    message(crayon::cyan(paste0("Your value for COMMODITY is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allCommodity for a vector of all acceptable values.")))
  }
  
  # Category
  if(is.null(category)){} else if(!toupper(category) %in% tidyUSDA::allCategory){
    recommendation <- crayon::red(fuzzyMatch(toupper(category), tidyUSDA::allCategory));
    message(crayon::cyan(paste0("Your value for CATEGORY is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allCategory for a vector of all acceptable values.")))
  }
  
  # Domain
  if(is.null(domain)){} else if(!toupper(domain) %in% tidyUSDA::allDomain){
    recommendation <- crayon::red(fuzzyMatch(toupper(domain), tidyUSDA::allDomain));
    message(crayon::cyan(paste0("Your value for DOMAIN is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allDomain for a vector of all acceptable values.")))
  }
  
  # Geographic level
  if(is.null(geographic_level)){} else if(!toupper(geographic_level) %in% tidyUSDA::allGeogLevel){
    recommendation <- crayon::red(fuzzyMatch(toupper(geographic_level), tidyUSDA::allGeogLevel));
    message(crayon::cyan(paste0("Your value for GEOGRAPHIC_LEVEL is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allGeogLevel for a vector of all acceptable values.")))
  }
  
  
  # Need to recode an & to the url encode %26
  if(is.null(sector)){}else{sector <- gsub(pattern = "&", replacement = "%26", x = sector)}
  if(is.null(data_item)){}else{data_item <- gsub(pattern = "&", replacement = "%26", x = data_item)}
  if(is.null(commodity)){}else{commodity <- gsub(pattern = "&", replacement = "%26", x = commodity)}
  if(is.null(category)){}else{category <- gsub(pattern = "&", replacement = "%26", x = category)}
  if(is.null(domain)){}else{domain <- gsub(pattern = "&", replacement = "%26", x = domain)}
  if(is.null(program)){}else{program <- gsub(pattern = "&", replacement = "%26", x = program)}
  
  
  
# Logic to handle vectors vs. single values 
 
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
  
  
  if(is.null(geographic_level)){geographic_level <- 'NON'}

  
  # STATE
  if(geometry & geographic_level == 'STATE'){
    geoms <- tigris::states()
    
    #options(tigris_use_cache = TRUE)
    
    # combined <- tigris::geo_join(spatial_data = geoms,
    #                              data_frame = mydata,
    #                              by_sp = 'STATEFP',
    #                              by_df = 'state_fips_code',
    #                              how = 'left')
    
    mydata.sf <- sf::st_as_sf(geoms)
    mydata <- dplyr::left_join(mydata,
                               mydata.sf,
                               by = c("state_fips_code" = "STATEFP"))
    
    mydata <- sf::st_as_sf(mydata)
    # mydata <- sf::st_as_sf(combined)
    
    if(lower48){mydata <- dplyr::filter(mydata, !(toupper(mydata$state_name) %in% c("ALASKA", "HAWAII", "PUERTO RICO")))}
  }
  
  # COUNTY
  if(geometry & geographic_level == 'COUNTY'){
    
    #options(tigris_use_cache = TRUE)
    geoms <- tigris::counties()
    geoms$COUNTYKEY <- paste0(geoms$STATEFP, geoms$COUNTYFP)
    
    
    mydata$COUNTYKEY <- paste0(mydata$state_ansi, mydata$county_code)
    
    # combined <- tigris::geo_join(spatial_data = geoms,
    #                              data_frame = mydata,
    #                              by_sp = 'COUNTYKEY',
    #                              by_df = 'COUNTYKEY',
    #                              how = 'left')
    
    mydata.sf <- sf::st_as_sf(geoms)
    mydata <- dplyr::left_join(mydata,
                               mydata.sf,
                               by = "COUNTYKEY")
    
    mydata <- sf::st_as_sf(mydata)
    # mydata <- sf::st_as_sf(combined)
    
    if(lower48){mydata <- dplyr::filter(mydata, !(toupper(mydata$state_name) %in% c("ALASKA", "HAWAII", "PUERTO RICO")))}
    
  }

  
  # Make sure value is numeric, and get rid of non-numerics
  mydata$Value <- gsub("[^0-9.-]", "", mydata$Value)
  mydata$Value <- as.numeric(mydata$Value)
  
  
  # Logic to handle imputing weighted by land area
  if(geometry & weighted_by_area){
    
    mydata <- mydata %>%
      dplyr::mutate(value_per_sq_mile = round(as.numeric(mydata$Value)/(as.numeric(mydata$ALAND)/2589988.110336), 4))  # this is conversion rate from meters ^2 to miles ^2
    
    
  }
  
  # If geometry, put important cols first
  if(geometry & geographic_level %in% c("COUNTY", "STATE")){
    mydata <- mydata %>%
      dplyr::select('GEOID', 'year', 'ALAND', 'unit_desc', 'short_desc', 'Value', dplyr::everything())
  }
  
  # If weighted value, put that up front, too
  if(weighted_by_area){
    mydata <- mydata %>%
      dplyr::select('GEOID', 'year', 'ALAND', 'unit_desc', 'short_desc', 'Value', 'value_per_sq_mile', dplyr::everything())
    
  }
  
  return(mydata)
}



