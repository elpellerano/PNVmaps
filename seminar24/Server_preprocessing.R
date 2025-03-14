library(terra)
library(sp)
input_folder <- "input_raster_present"

# Load point data (Biome6000.csv)
points_data <- read.csv(file.path(input_folder, "Biome6000.csv"))

# List of .tifs in input folder
raster_files <- list.files(input_folder, pattern = "\\.tif$", full.names = TRUE, recursive = TRUE)

# problems with projeciton. reprojection with reference raster fronm chelsa
ref_rast <- rast(raster_files[[1]])

# List of  DEM and Litho-Raster
dem_files <- c(
  "input_raster_present/DEM/merged_dem_land.tif",
  "input_raster_present/DEM/slope_layer.tif",
  "input_raster_present/DEM/tpi_15.tif"
)

litho_file <- "input_raster_present/Litho/Lit_resampled.tif"

# DEM-Raster bilinear Interpolation 
fixed_dem <- lapply(dem_files, function(f) {
  r <- rast(f)
  r <- project(r, ref_rast, method="bilinear")  # Interpoliert Höhenwerte
  return(r)
})

# Litho-Raster with nearest neighbor
litho_rast <- rast(litho_file)
litho_fixed <- project(litho_rast, ref_rast, method="near")  # Kategorische Werte beibehalten

# save 
for (i in seq_along(fixed_dem)) {
  writeRaster(fixed_dem[[i]], dem_files[i], overwrite=TRUE)
}

writeRaster(litho_fixed, litho_file, overwrite=TRUE)  # Litho speichern

#new Liste with all Files, now corrected
updated_raster_files <- c(raster_files, dem_files, litho_file)

# check dimensions
sapply(updated_raster_files, function(f) dim(rast(f)))

# Load the files
raster_stack <- rast(raster_files)

# coordinates from Biome6000 must be numeric
points_data$Longitude <- as.numeric(points_data$Longitude)
points_data$Latitude <- as.numeric(points_data$Latitude)

# SpatialPointsDataFrame from point data and Projection in the right Format
coordinates(points_data) <- ~Longitude + Latitude
proj4_string <- crs(raster_stack, proj = TRUE)  # PROJ4-String (program behind terra & raster)

proj4string(points_data) <- proj4_string  

# SpatialPointsDataFrame in SpatVector because of promblems with PROJ4
points_vect <- vect(points_data)

# extract point data values from raster for covariate matrix (I'm not shure with what method I did it)
extracted_values <- extract(raster_stack, points_vect) #option 1
extracted_values <- terra::extract(raster_stack, points_data) #option 2
print(extracted_values)

# Kombination of extracted values with target variables (Biome names)
covariate_matrix <- cbind(points_data$Biome.6000.Consolidated.Name, extracted_values)

# save csv
output_file <- file.path(input_folder, "covariate_matrix.csv")
write.csv(covariate_matrix, output_file, row.names = FALSE)



