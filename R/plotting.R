#!/usr/bin/R
# plotting.R


plotUSDA <- function(df){
  
  #' plotUSDA
  #' @description 
  #' Quickly plot a dataframe produced by the getQuickstat() function. 
  #'     
  #' @param df a dataframe with a simple feature column
  #' @param title title for the plot
  #' @export

  z <- ggplot2::ggplot(df) +
    ggplot2::geom_sf(ggplot2::aes(fill = df$Value)) +
    ggplot2::coord_sf(datum=NA) +
    ggplot2::scale_fill_viridis_d() +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "None") 
  
  return(z)
  
}

