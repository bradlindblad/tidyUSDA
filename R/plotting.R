#!/usr/bin/R
# plotting.R


plotUSDA <- function(df){
  
  #' plotUSDA
  #' 
  #' @description 
  #' Quickly plot a data frame produced by the getQuickstat() function. 
  #'     
  #' @param df a data frame with a simple feature column
  #' 
  #' @examples 
  #' \dontrun{
  #' # Use output from getQuickstat()
  #' plotUSDA(df = df_from_getQuickstat)
  #' }
  #' 
  #' @export

  z <- ggplot2::ggplot(df) +
    ggplot2::geom_sf(ggplot2::aes(fill = df$Value)) +
    ggplot2::coord_sf(datum=NA) +
    ggplot2::scale_fill_viridis_d() +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "None") 
  
  return(z)
  
}

