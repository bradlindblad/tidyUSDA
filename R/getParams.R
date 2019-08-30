#!/usr/bin/R
# getParams.R


# key <- '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'

getAllProgram <- function(key){
  
  #' Get all possible values from PROGRAM field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out <- tryCatch(
    {
      param = "source_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec) 
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}

getAllSector <- function(key){
  
  #' Get all possible values from SECTOR field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out<- tryCatch(
    {
      param = "sector_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}

getAllGroup <- function(key){
  
  #' Get all possible values from GROUP field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out <- tryCatch(
    {
      param = "group_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}    

getAllCommodity <- function(key){
  
  #' Get all possible values from COMMODITY field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out <- tryCatch(
    {
      param = "commodity_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}       
    
getAllCategory <- function(key){
  
  #' Get all possible values from CATEGORY field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out <- tryCatch(
    {
      param = "statisticcat_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}  

getAllDataItem <- function(key){
  
  #' Get all possible values from DATA ITEM field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out <- tryCatch(
    {
      param = "short_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}
  
getAllDomain <- function(key){
  
  #' Get all possible values from DOMAIN field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  

  out <- tryCatch(
    {
      param = "domain_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)

 

  
}

getAllGeogLevel <- function(key){
  
  #' Get all possible values from GEOGRAPHIC LEVEL field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out <- tryCatch(
    {
      param = "agg_level_desc"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}

getAllState <- function(key){
  
  #' Get all possible values from STATE field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  out <- tryCatch(
    {
      param = "state_name"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}

getAllCounty <- function(key){
  
  #' Get all possible values from COUNTY field
  #' 
  #' @param key your USDA api key
  #' @return All possible values of PROGRAM
  #' @examples \dontrun{getAllProgram(key)}
  #' @export

  
  out <- tryCatch(
    {
      param = "county_name"
      
      key <- key
      
      key <- paste0(key,'&param=')
      
      base <- 'http://quickstats.nass.usda.gov/api/get_param_values/?key='
      
      url <- paste0(base, key , param)
      
      vec <- jsonlite::fromJSON(url)
      
      vec <- unlist(vec)
      
      return(vec)
    }, 
    
    error=function(cond) {
      message("Error: The API Key you provided appears to be invalid.")
      message("Visit 'https://quickstats.nass.usda.gov/api' to obtain a valid API Key.")
      # Return an NA in case of an error
      return(NA)
    }
  )
  
  return(out)
  
}


