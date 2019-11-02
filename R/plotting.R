#!/usr/bin/R
# plotting.R

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

plotUSDA <- function(df, fill_by = 'Value'){
  
  
  # Install rgeos if not already installed
  if (!"rgeos" %in% utils::installed.packages()) {
    stop(crayon::cyan("Package \"rgeos\" needed for this function to work. Please install it with install.packages(\"rgeos\")"),
         call. = FALSE)
  }

  
  # Logic to warn if using Mac OsX - issue with plotting
  quartz <- FALSE
  stopit <- FALSE
  
  
  if(identical(getOption("bitmapType"), "quartz")) {quartz <- TRUE}
  if(quartz) {
    
    stopit <- message(cat(crayon::cyan("It appears your session is using a", crayon::red("quartz graphics device"), crayon::cyan("- probably macOS. The quartz graphics device doesn't handle the underlying ggplot2::geom_sf() very well. We recommend you either switch to another device, like X11, or use a package like tmap or leaflet to plot this dataframe. You can still use plotUSDA with quartz, it just may take 10 minutes."))))

  # if(stopit) {message("Quitting, gonna try another mapping package like tmap or leaflet.")}
  }
  
  z <- ggplot2::ggplot(df) +
    ggplot2::geom_sf(ggplot2::aes_string(fill = fill_by)) +
    ggplot2::coord_sf(datum=NA) +
    ggplot2::scale_fill_viridis_c() +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "None") 
  
  return(z)
  
}


