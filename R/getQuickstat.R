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


# Geospatial functions - thanks Kyle! -------------------------------------

# Load tiger
load_tiger <- function(url,
                       refresh=getOption("tigris_refresh", FALSE),
                       tigris_type=NULL,
                       class = getOption("tigris_class", "sp"),
                       progress_bar = TRUE,
                       query = NULL) {
  
  use_cache <- getOption("tigris_use_cache", FALSE)
  tiger_file <- basename(url)
  
  obj <- NULL
  
  if (use_cache) {
    if (Sys.getenv("TIGRIS_CACHE_DIR") != "") {
      cache_dir <- Sys.getenv("TIGRIS_CACHE_DIR")
      cache_dir <- path.expand(cache_dir)
    } else {
      cache_dir <- user_cache_dir("tigris")
    }
    if (!file.exists(cache_dir)) {
      dir.create(cache_dir, recursive=TRUE)
    }
    
    if (file.exists(cache_dir)) {
      
      file_loc <- file.path(cache_dir, tiger_file)
      
      if (refresh | !file.exists(file_loc)) {
        # try(download.file(url, file_loc, mode = "wb"))
        # GET requests not working at the moment.
        # Change back if you get additional info.
        
        if (progress_bar) {
          try(GET(url,
                  write_disk(file_loc, overwrite=refresh),
                  progress(type="down")), silent=TRUE)
        } else {
          try(GET(url,
                  write_disk(file_loc, overwrite=refresh)),
              silent=TRUE)
        }
        
        
      }
      
      shape <- gsub(".zip", "", tiger_file)
      shape <- gsub("_shp", "", shape) # for historic tracts
      
      if (refresh | !file.exists(file.path(cache_dir,
                                           sprintf("%s.shp", shape)))) {
        
        unzip_tiger <- function() {
          unzip(file_loc, exdir = cache_dir, overwrite=TRUE)
        }
        
        # Logic for handling download errors and re-downloading
        t <- tryCatch(unzip_tiger(), warning = function(w) w)
        
        if ("warning" %in% class(t)) {
          
          i <- 1
          
          while (i < 4) {
            
            message(sprintf("Previous download failed.  Re-download attempt %s of 3...",
                            as.character(i)))
            
            # try(download.file(url, file_loc, mode = "wb"))
            
            if (progress_bar) {
              try(GET(url,
                      write_disk(file_loc, overwrite=TRUE),
                      progress(type="down")), silent=TRUE)
            } else {
              try(GET(url,
                      write_disk(file_loc, overwrite=TRUE)),
                  silent=TRUE)
            }
            
            
            
            shape <- gsub(".zip", "", tiger_file)
            shape <- gsub("_shp", "", shape)
            
            t <- tryCatch(unzip_tiger(), warning = function(w) w)
            
            if ("warning" %in% class(t)) {
              i <- i + 1
            } else {
              break
            }
            
          }
          
          if (i == 4) {
            
            stop("Download failed; check your internet connection or the status of the Census Bureau website
                 at http://www2.census.gov/geo/tiger/.", call. = FALSE)
          }
          
        } else {
          
          unzip_tiger()
          
        }
        
      }
      
      if (class == "sp") {
        
        obj <- rgdal::readOGR(dsn = cache_dir, layer = shape, encoding = "UTF-8",
                       verbose = FALSE, stringsAsFactors = FALSE)
        
        if (is.na(proj4string(obj))) {
          
          proj4string(obj) <- CRS("+proj=longlat +datum=NAD83 +no_defs")
          
        }
        
      } else if (class == "sf") {
        
        obj <- st_read(dsn = cache_dir, layer = shape,
                       quiet = TRUE, stringsAsFactors = FALSE)
        
        if (is.na(st_crs(obj)$proj4string)) {
          
          st_crs(obj) <- "+proj=longlat +datum=NAD83 +no_defs"
          
        }
        
      }
      
      
      
    }
    
  } else {
    
    tmp <- tempdir()
    file_loc <- file.path(tmp, tiger_file)
    
    if (progress_bar) {
      try(GET(url, write_disk(file_loc),
              progress(type = "down")), silent = TRUE)
    } else {
      try(GET(url, write_disk(file_loc)),
          silent = TRUE)
    }
    
    
    # download.file(url, tiger_file, mode = 'wb')
    unzip(file_loc, exdir = tmp)
    shape <- gsub(".zip", "", tiger_file)
    shape <- gsub("_shp", "", shape) # for historic tracts
    
    
    if (class == "sp") {
      
      obj <- rgdal::readOGR(dsn = tmp, layer = shape, encoding = "UTF-8",
                     verbose = FALSE, stringsAsFactors = FALSE)
      
      if (is.na(proj4string(obj))) {
        
        proj4string(obj) <- CRS("+proj=longlat +datum=NAD83 +no_defs")
        
      }
      
    } else if (class == "sf") {
      
      obj <- st_read(dsn = tmp, layer = shape,
                     quiet = TRUE, stringsAsFactors = FALSE)
      
      if (is.na(st_crs(obj)$proj4string)) {
        
        st_crs(obj) <- "+proj=longlat +datum=NAD83 +no_defs"
        
      }
      
    }
    
  }
  
  attr(obj, "tigris") <- "tigris"
  
  # this will help identify the object "sub type"
  if (!is.null(tigris_type)) attr(obj, "tigris") <- tigris_type
  
  # Take care of COUNTYFP, STATEFP issues for historic data
  if ("COUNTYFP00" %in% names(obj)) {
    obj$COUNTYFP <- obj$COUNTYFP00
    obj$STATEFP <- obj$STATEFP00
  }
  if ("COUNTYFP10" %in% names(obj)) {
    obj$COUNTYFP <- obj$COUNTYFP10
    obj$STATEFP <- obj$STATEFP10
  }
  if ("COUNTY" %in% names(obj)) {
    obj$COUNTYFP <- obj$COUNTY
    obj$STATEFP <- obj$STATE
  }
  if ("CO" %in% names(obj)) {
    obj$COUNTYFP <- obj$CO
    obj$STATEFP <- obj$ST
  }
  
  return(obj)
  
}

# Is tigris
is_tigris <- function (obj) 
{
  !is.null(attr(obj, "tigris"))
}

# Geo join
geo_join <- function (spatial_data, data_frame, by_sp, by_df, by = NULL, 
                      how = "left") 
{
  if (!is.null(by)) {
    by_sp <- by
    by_df <- by
  }
  if (class(spatial_data)[1] %in% c("SpatialGridDataFrame", 
                                    "SpatialLinesDataFrame", "SpatialPixelsDataFrame", "SpatialPointsDataFrame", 
                                    "SpatialPolygonsDataFrame")) {
    spatial_data@data <- data.frame(spatial_data@data, data_frame[match(spatial_data@data[[by_sp]], 
                                                                        data_frame[[by_df]]), ])
    if (how == "inner") {
      matches <- match(spatial_data@data[[by_sp]], data_frame[[by_df]])
      spatial_data <- spatial_data[!is.na(matches), ]
      return(spatial_data)
    }
    else if (how == "left") {
      return(spatial_data)
    }
    else {
      stop("The available options for `how` are 'left' and 'inner'.", 
           call. = FALSE)
    }
  }
  else if ("sf" %in% class(spatial_data)) {
    join_vars <- c(by_df)
    names(join_vars) <- by_sp
    if (how == "inner") {
      joined <- spatial_data %>% inner_join(data_frame, 
                                            by = join_vars) %>% st_as_sf()
      attr(joined, "tigris") <- tigris_type(spatial_data)
      return(joined)
    }
    else if (how == "left") {
      df_unique <- data_frame %>% group_by_(by_df) %>% 
        mutate(rank = row_number()) %>% filter(rank == 
                                                 1)
      joined <- spatial_data %>% left_join(df_unique, by = join_vars) %>% 
        st_as_sf()
      if (!is.na(st_crs(spatial_data)$epsg)) {
        crs <- st_crs(spatial_data)$epsg
      }
      else {
        crs <- st_crs(spatial_data)$proj4string
      }
      st_crs(joined) <- crs
      attr(joined, "tigris") <- tigris_type(spatial_data)
      return(joined)
    }
    else {
      stop("The available options for `how` are 'left' and 'inner'.", 
           call. = FALSE)
    }
  }
}

# Tigris type
tigris_type <- function (obj) 
{
  if (is_tigris(obj)) 
    return(attr(obj, "tigris"))
  return(NA)
}

# Counties
get.counties <- function(){
  
  temp <- tempfile()
  download.file("https://www2.census.gov/geo/tiger/TIGER2019/COUNTY/tl_2019_us_county.zip", "counties", mode = "wb")
  unzip("counties")
  file.remove("counties")
  
  z <- rgdal::readOGR("tl_2019_us_county.shp")
  file.remove(c("tl_2019_us_county.cpg", "tl_2019_us_county.dbf",
                "tl_2019_us_county.prj", "tl_2019_us_county.shp",
                "tl_2019_us_county.shp.ea.iso.xml", "tl_2019_us_county.shp.iso.xml",
                "tl_2019_us_county.shx"))
  return(z)
}

# States

get.states <- function(){
  
  temp <- tempfile()
  download.file("https://www2.census.gov/geo/tiger/TIGER2019/STATE/tl_2019_us_state.zip", "states", mode = "wb")
  unzip("states")
  file.remove("states")
  
  z <- rgdal::readOGR("tl_2019_us_state.shp")
  file.remove(c("tl_2019_us_state.cpg", "tl_2019_us_state.dbf",
                "tl_2019_us_state.prj", "tl_2019_us_state.shp",
                "tl_2019_us_state.shp.ea.iso.xml", "tl_2019_us_state.shp.iso.xml",
                "tl_2019_us_state.shx"))
  return(z)
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

getQuickstat <- function(key=NULL, program=NULL, data_item=NULL, sector=NULL, group=NULL, commodity=NULL,
                         category=NULL, domain=NULL, geographic_level=NULL,
                         state=NULL, county=NULL, year=NULL, geometry = FALSE, lower48 = FALSE) {
  
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
  # data_item = 'CROP TOTALS - OPERATIONS WITH SALES'
  # geographic_level = 'STATE'
  # year = '2017'
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
  #' year = '2017',
  #' state = NULL,
  #' geometry = T,
  #' lower48 = T)
  #' 
  #' }


# Logic to handle improper inputs
  
  # Key
  if(is.null(key)){
    message("API key missing; enter an API key.")
  } 
  
  # Program
  if(is.null(program)){} else if(!toupper(program) %in% tidyUSDA::allProgram){
    recommendation <- fuzzyMatch(toupper(program), tidyUSDA::allProgram);
    message(paste0("Your value for PROGRAM is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allProgram for a vector of all acceptable values."))
  }
  
  # Data item
  if(is.null(data_item)){} else if(!toupper(data_item) %in% tidyUSDA::allDataItem){
    recommendation <- fuzzyMatch(toupper(data_item), tidyUSDA::allDataItem);
    message(paste0("Your value for DATA_ITEM is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allDataItem for a vector of all acceptable values."))
  }
  
  # Sector
  if(is.null(sector)){} else if (!is.null(sector) & !toupper(sector) %in% tidyUSDA::allSector){
    recommendation <- fuzzyMatch(toupper(sector), tidyUSDA::allSector);
    message(paste0("Your value for SECTOR is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allSector for a vector of all acceptable values."))
  }

  # Group
  if(is.null(group)){} else if(!toupper(group) %in% tidyUSDA::allGroup){
    recommendation <- fuzzyMatch(toupper(group), tidyUSDA::allGroup);
    message(paste0("Your value for GROUP is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allGroup for a vector of all acceptable values."))
  }
  
  # Commodity
  if(is.null(commodity)){} else if(!toupper(commodity) %in% tidyUSDA::allCommodity){
    recommendation <- fuzzyMatch(toupper(commodity), tidyUSDA::allCommodity);
    message(paste0("Your value for COMMODITY is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allCommodity for a vector of all acceptable values."))
  }
  
  # Category
  if(is.null(category)){} else if(!toupper(category) %in% tidyUSDA::allCategory){
    recommendation <- fuzzyMatch(toupper(category), tidyUSDA::allCategory);
    message(paste0("Your value for CATEGORY is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allCategory for a vector of all acceptable values."))
  }
  
  # Domain
  if(is.null(domain)){} else if(!toupper(domain) %in% tidyUSDA::allDomain){
    recommendation <- fuzzyMatch(toupper(domain), tidyUSDA::allDomain);
    message(paste0("Your value for DOMAIN is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allDomain for a vector of all acceptable values."))
  }
  
  # Geographic level
  if(is.null(geographic_level)){} else if(!toupper(geographic_level) %in% tidyUSDA::allGeogLevel){
    recommendation <- fuzzyMatch(toupper(geographic_level), tidyUSDA::allGeogLevel);
    message(paste0("Your value for GEOGRAPHIC_LEVEL is not valid. Did you mean ",
                   recommendation,
                   "? If not, check tidyUSDA::allGeogLevel for a vector of all acceptable values."))
  }
  
  
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
    geoms <- get.states()
    
    #options(tigris_use_cache = TRUE)
    
    combined <- geo_join(spatial_data = geoms,
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
    geoms <- get.counties()
    geoms@data$COUNTYKEY <- paste0(geoms@data$STATEFP, geoms@data$COUNTYFP)
    
    
    mydata$COUNTYKEY <- paste0(mydata$state_ansi, mydata$county_code)
    
    combined <- geo_join(spatial_data = geoms,
                                 data_frame = mydata,
                                 by_sp = 'COUNTYKEY',
                                 by_df = 'COUNTYKEY',
                                 how = 'inner')
    
    mydata <- sf::st_as_sf(combined)
    
    if(lower48){mydata <- dplyr::filter(mydata, !(toupper(mydata$state_name) %in% c("ALASKA", "HAWAII", "PUERTO RICO")))}
    
  }
  
  # Make sure value is numeric
  mydata$Value <- gsub(",", "", mydata$Value)
  mydata$Value <- as.numeric(mydata$Value)
  
  return(mydata)
}
  


