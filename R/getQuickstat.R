
# IN PROGRESS


# key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'
# program = 'CENSUS'
# data_item = 'CATTLE, (EXCL COWS) - INVENTORY'
# geographic_level = 'STATE'
# state = NULL
# year = '2017'
# geometry = T
# sector=NULL
# group=NULL
# commodity=NULL
# category=NULL
# domain='TOTAL'
# county=NULL




# 
# key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'
# program = 'CENSUS'
# data_item = 'CHICKENS - INVENTORY'
# geographic_level = NULL
# state = NULL
# year = NULL
# geometry = T
# sector=NULL
# group=NULL
# commodity=NULL
# category=NULL
# domain=NULL
# county=NULL


getQuickstat <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, domain=NULL, geographic_level=NULL,
                         state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE) {
  
  #' getQuickstat
  #' @description 
  #' Get values from Quickstats in a dataframe or data frame
  #' with sf:: geometry field
  #' @param key your USDA api key. Get one at https://quickstats.nass.usda.gov/api
  #' @param program program field
  #' @param data_item data_item field
  #' @param sector sector field
  #' @param group group field
  #' @param commodity commodity field
  #' @param category category field
  #' @param domain domain field
  #' @param geographic_level geographic_level field
  #' @param state state field
  #' @param county county field
  #' @param year year field
  #' @param geometry geometry field (TRUE or FALSE), set to TRUE if you would like a simple features (SF) geometry field included. 
  #' Only works when geographic_level is set to 'COUNTY' or 'STATE'
  #' @param lower48 limit data to the lower 48 states?
  #' @export
  #' 
  #' 
  #' @note  
  #'Go to the webpage https://quickstats.nass.usda.gov/. As a best practice, select the items in these fields and test that that data item 
  #'    exists in the browser before using those parameters in this function. When you have a dataset that works, enter those values in the 
  #'    function as parameters. Ideally, only enter values for your key obviously, then PROGRAM, DATA_ITEM, GEOGRAPHIC_LEVEL and then if
  #'    necessary, DOMAIN, STATE, COUNTY or YEAR. 
  #' 

  beginning <- "http://quickstats.nass.usda.gov/api/api_GET/?key="
  
  
  
  if(exists("program") & !is.null(program)){param1 <- paste0('&source_desc=', program)}else{param1 <- NULL}
  if(exists("sector") & !is.null(sector)){param2 <- paste0('&sector_desc=', sector)}else{param2 <- NULL}
  if(exists("group") & !is.null(group)){param3 <- paste0('&group_desc=', group)}else{param3 <- NULL}
  if(exists("commodity") & !is.null(commodity)){param4 <- paste0('&commodity_desc=', commodity)}else{param4 <- NULL}
  if(exists("category") & !is.null(category)){param6 <- paste0('&statisticcat_desc=', category)}else{param6 <- NULL}
  if(exists("data_item") & !is.null(data_item)){param7 <- paste0('&short_desc=', data_item)}else{param7 <- NULL}
  if(exists("domain") & !is.null(domain)){param8 <- paste0('&domain_desc=', domain)}else{param8 <- NULL}
  if(exists("geographic_level") & !is.null(geographic_level)){param9 <- paste0('&agg_level_desc=', geographic_level)}else{param9 <- NULL}
  if(exists("state") & !is.null(state)){param10 <- paste0('&state_name=', state)}else{param10 <- NULL}
  if(exists("county") & !is.null(county)){param11 <- paste0('&county_name=', county)}else{param11 <- NULL}
  if(exists("year") & !is.null(year)){param12 <- paste0('&year=', year)}else{param12 <- NULL}
  
  
  params <- c(beginning, key, param1, param2, param3, param4, param6, param7, param8, param9, param10, param11, param12)
  
  
  
  
  url <- paste0(params, collapse = ",")
  url <- gsub(",&", "&", url)
  url <- gsub("=,", "=", url)
  url <- gsub(" ", "%20", url)
  
  raw <- jsonlite::fromJSON(url)
  raw <- raw$data
  mydata <- raw
  
  
  
  if(is.null(program)){program <- 'NON'}
  if(is.null(sector)){sector <- 'NON'}
  if(is.null(group)){group <- 'NON'}
  if(is.null(commodity)){commodity <- 'NON'}
  if(is.null(category)){category <- 'NON'}
  if(is.null(data_item)){data_item <- 'NON'}
  if(is.null(domain)){domain <- 'NON'}
  if(is.null(geographic_level)){geographic_level <- 'NON'}
  if(is.null(state)){state <- 'NON'}
  if(is.null(county)){county <- 'NON'}
  if(is.null(year)){year <- 'NON'} 
  
  
  
  
  # Test to see if geom has been assigned a value or not
  # has.geographic.level <- ifelse(!is.null(geographic_level),T, F)

  # Set can.plot to default true
  # can.plot <- T
  # geographic_level <- 'STATE'
  # geographic_level <- NULL
  # geographic_level
  # geographic_levelstringr::str_detect(geographic_level, "STATE")
  # Test if they want geometry and if state or county is NOT specified (as that's an error)
  #if(geometry  & is.null(state) & is.null(county)){print("Error in 'geometry=TRUE', no state or county-level specified. Enter a state or county."); can.plot <- F}
  #if(geometry & is.null("param10") & !exists("geographic.level")){print("Error in 'geometry=TRUE', if you specify a state in 'STATE=', you need to set GEOGRAPHIC_LEVEL='STATE'")}
  #if(geometry & is.null("param11") & !exists("geographic.level")){print("Error in 'geometry=TRUE', if you specify a state in 'STATE=', you need to set GEOGRAPHIC_LEVEL='STATE'")}
  # lower48 <- T
  # STATE
  if(geometry & geographic_level == 'STATE' & county == 'NON'){
    geoms <- tigris::states()
    
    #options(tigris_use_cache = TRUE)
    
    combined <- tigris::geo_join(spatial_data = geoms,
                                 data_frame = raw,
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
    
    
    raw$COUNTYKEY <- paste0(raw$state_ansi, raw$county_code)
    
    combined <- tigris::geo_join(spatial_data = geoms,
                                 data_frame = raw,
                                 by_sp = 'COUNTYKEY',
                                 by_df = 'COUNTYKEY',
                                 how = 'inner')
    
    mydata <- sf::st_as_sf(combined)
    
    if(lower48){mydata <- dplyr::filter(mydata, !(toupper(mydata$state_name) %in% c("ALASKA", "HAWAII", "PUERTO RICO")))}
    
  }
  
  
  
  # 
  # if(geometry & can.plot){
  #   # STATE ------------------------------------------------------------------
  #   if(stringr::str_detect(param9, "STATE")){   # if state is not null and county is null, then do this
  #   geoms <- tigris::states()
  #   
  #   combined <- tigris::geo_join(spatial_data = geoms,
  #                                data_frame = raw,
  #                                by_sp = 'STATEFP',
  #                                by_df = 'state_fips_code',
  #                                how = 'inner')
  #   
  #   mydata <- sf::st_as_sf(combined)
  #   }
  # 
  # 
  # # COUNTY ------------------------------------------------------------------
  #   if(stringr::str_detect(param9, "COUNTY")){  # if county is not null, then do this
  #     geoms <- tigris::counties()
  #     geoms@data$COUNTYKEY <- paste0(geoms@data$STATEFP, geoms@data$COUNTYFP)
  #     
  #     
  #     raw$COUNTYKEY <- paste0(raw$state_ansi, raw$county_code)
  #     
  #     combined <- tigris::geo_join(spatial_data = geoms,
  #                                  data_frame = raw,
  #                                  by_sp = 'COUNTYKEY',
  #                                  by_df = 'COUNTYKEY',
  #                                  how = 'inner')
  #     
  #     mydata <- sf::st_as_sf(combined)
  #   }
  #   
  #   # ggplot(mydat) +
  #   #   geom_sf(aes(fill = mydat$Value)) +
  #   #   theme_minimal() +
  #   #   scale_fill_viridis_d() +
  #   #   theme(legend.position = 'NONE')
  #   
  #  # plot(mydata)
  # }
  return(mydata)
  
}
  
# test <- getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
#                      program = 'CENSUS',
#                      data_item = 'CHICKENS - INVENTORY',
#                      geometry = T)
# 
# test2 <- getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
#                       program = 'SURVEY',
#                       data_item = 'CROP TOTALS, (EXCL HORTICULTURE) - PRODUCTION, MEASURED IN $',
#                       geographic_level = 'STATE',
#                       # state = 'NORTH DAKOTA',
#                       year = '2017',
#                       geometry = T,
#                       lower48 = T)



