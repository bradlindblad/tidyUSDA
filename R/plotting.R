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

  
  # Logic to warn if using Mac OsX - issue with plotting
  mac <- FALSE
  stopit <- FALSE
  if(stringi::stri_detect(str = utils::osVersion, regex = "mac")) {mac <- TRUE}
  if(mac) {
    
    stopit <- usethis::ui_yeah("It appears you are using Mac. Mac OsX has a graphics device that doesn't handle the underlying ggplot2::geom_sf() very well. We recommend you use a package like tmap or leaflet to plot this dataframe. You can still use plotUSDA, it will just take 10 minutes possibly. Do you want to skip plotting using plotUSDA?")
  }
  
  if(stopit) {stop("Quitting since using Mac, gonna try another mapping package like tmap or leaflet.")}
  
  z <- ggplot2::ggplot(df) +
    ggplot2::geom_sf(ggplot2::aes_string(fill = fill_by)) +
    ggplot2::coord_sf(datum=NA) +
    ggplot2::scale_fill_viridis_c() +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "None") 
  
  return(z)
  
}

