
library(sf)
library(ggplot2)


plotUSDA <- function(df, title="USDA Plot"){
  
  #' @description 
  #' Quickly plot a dataframe produced by the getQuickstat() function. 
  #'     
  #' @param df: a dataframe with a simple feature column
  #' @param title: title for the plot
  #'
  #' @example 
  #' 
  #' # Get chicken inventory
  #' test <- getQuickstat(key = myAPIkey,
  #'     program = 'CENSUS',
  #'     data_item = 'CHICKENS - INVENTORY',
  #'     geometry = F)
  #' 
  #' plotUSDA(df = test,
  #'     title = "An interesting title")
  
  
  ggplot(df) +
    geom_sf(aes(fill = df$Value)) +
    scale_fill_viridis_d() +
    theme_minimal() +
    theme(legend.position = "None") +
    ggtitle(title)
  
  
  
}


