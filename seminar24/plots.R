  library(terra)
  library(ggplot2)
  library(tidyterra)
  library(gridExtra)
  

#Plotting minimum temperatures for the 12 months
  tmin_stack <- c(tmin1, tmin2, tmin3, tmin4, tmin5, tmin6, 
                tmin7, tmin8, tmin9, tmin10, tmin11, tmin12)

# Function for multi-layer SpatRaster
plot_raster_stack <- function(raster_stack, base_name = "Temperature") {

  
  # Create a list to store plots
  plot_list <- list()
  
  # Loop through the layers
  for (i in 1:nlyr(raster_stack)) {
    # Get the current layer
    r <- raster_stack[[i]]
    
    # Create title with month name
    title <- paste0(month.name[i], " - ", base_name)
    
    # Create plot with ggplot2
    p <- ggplot() +
      geom_spatraster(data = r) +
      scale_fill_viridis_c(name = base_name) +
      labs(title = title) +
      theme_minimal() +
      theme(plot.title = element_text(size = 11))
    
    plot_list[[i]] <- p
  }
  
  # Arrange all plots in a grid
  grid_plot <- grid.arrange(grobs = plot_list, ncol = 3)
  return(grid_plot)
}

# Use the function with your SpatRaster
plot_raster_stack(tmin_stack, base_name = "Minimum Temperature (°C)")

#Plotting macimum temperatures for the 12 months

tmax_stack <- rast(list(tmax1, tmax2, tmax3, tmax4, tmax5, tmax6, 
                        tmax7, tmax8, tmax9, tmax10, tmax11, tmax12))
plot_raster_stack(tmax_stack, base_name = "Maximum Temperature (°C)")


tmean_stack <- rast(list(tmean1, tmean2, tmean3, tmean4, tmean5, tmean6, 
                         tmean7, tmean8, tmean9, tmean10, tmean11, tmean12))



# Create SpatRaster stack for precipitation
prec_stack <- rast(list(prec1, prec2, prec3, prec4, prec5, prec6, 
                        prec7, prec8, prec9, prec10, prec11, prec12))

plot_raster_stack(prec_stack, base_name = "Precipitation (mm)")


# Create a SpatRaster stack for bioclimatic variabls

bio_stack <- rast(list(bio1, bio2, bio3, bio4, bio5, bio6, 
                       bio7, bio10, bio11, bio12, bio13, bio14, bio16, bio17))

plot_raster_stack(bio_stack, base_name = "Bioclimatic Variables")
