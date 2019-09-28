#!/usr/bin/R
# plotting.R


plotUSDA <- function(df, fill_by = 'Value'){
  
  #' plotUSDA
  #' 
  #' @description 
  #' Quickly plot a data frame produced by the getQuickstat() function. 
  #'     
  #' @param df a data frame with a simple feature column (geometry)
  #' 
  #' @param fill_by the value you would like to fill your choropleth output
  #' 
  #' @examples 
  #' \dontrun{
  #' # Use output from getQuickstat()
  #' plotUSDA(df = df_from_getQuickstat)
  #' }
  #' 
  #' @export

  
  z <- ggplot2::ggplot(df) +
    ggplot2::geom_sf(ggplot2::aes_string(fill = fill_by)) +
    ggplot2::coord_sf(datum=NA) +
    ggplot2::scale_fill_viridis_c() +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "None") 
  
  return(z)
  
}

