
library(tidyverse)
library(jsonlite)



program, sector, group, commodity,
category, data_item, domain, geographic_level,
region, ag_district, state, county, year

key <- '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'

getAllProgram <- function(key){
  
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
  
  param = "group_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllCategory <- function(key){
  
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
  
  param = "domain"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}

getAllGeogLevel <- function(key){
  
  param = "agg_level_desc"
  
  key <- key
  
  key <- paste0(key,'&param=')
  
  base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
  
  url <- paste0(base, key , param)
  
  vec <- jsonlite::fromJSON(url)
  
  vec <- unlist(vec)
  
  return(vec)
  
}