
library(tidyverse)
library(jsonlite)




# key <- '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'

getAllProgram <- function(key){
  
  #' Get all possible values from PROGRAM field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllProgram(mykey)
  #' 
  #'# View the vector in RStudio in order to search for terms 
  #'View(x)
  
  param = "source_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllSector <- function(key){
  
  #' Get all possible values from SECTOR field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllSector(mykey)
  #' 
  #'# View the vector in RStudio in order to search for terms 
  #'View(x)
  #'  
  param = "sector_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllGroup <- function(key){
  
  #' Get all possible values from GROUP field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllGroup(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  
  param = "group_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllCommodity <- function(key){
  
  #' Get all possible values from COMMODITY field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllCommodity(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  param = "commodity_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllCategory <- function(key){
  
  #' Get all possible values from CATEGORY field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllCategory(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  param = "statisticcat_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllDataItem <- function(key){
  
  #' Get all possible values from DATA ITEM field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllDataItem(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  param = "short_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllDomain <- function(key){
  
  #' Get all possible values from DOMAIN field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllDomain(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  param = "domain_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllGeogLevel <- function(key){
  
  #' Get all possible values from GEOGRAPHIC LEVEL field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllGeogLevel(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  param = "agg_level_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllState <- function(key){
  
  #' Get all possible values from STATE field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllState(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  param = "state_name"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllCounty <- function(key){
  
  #' Get all possible values from COUNTY field
  #' 
  #' @param key: your USDA api key
  #' 
  #' @examples
  #'x <- tidyUSDA::getAllCounty(mykey)
  #' 
  #'# View the vector in RSTudio in order to search for terms 
  #'View(x)
  
  param = "county_name"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}


