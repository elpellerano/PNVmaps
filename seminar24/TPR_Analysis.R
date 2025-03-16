# --- Load required libraries ---
library(sp)
library(terra)
library(caret)


Biome6000 <- read.csv("input_raster_present/Biome6000.csv")
predictions <- rast("predictions_world_present.tif")

# Replace spaces, hyphens, and slashes with dots in the target variable
Biome6000$Biome.6000.Consolidated.Name <- gsub(" ", ".", Biome6000$Biome.6000.Consolidated.Name)
Biome6000$Biome.6000.Consolidated.Name <- gsub("-", ".", Biome6000$Biome.6000.Consolidated.Name)
Biome6000$Biome.6000.Consolidated.Name <- gsub("/", ".", Biome6000$Biome.6000.Consolidated.Name)

# Check unique target names and compare with raster names
target_classes <- unique(Biome6000$Biome.6000.Consolidated.Name)
raster_names <- names(predictions)

print(target_classes)
print(raster_names)

# Convert Biome6000 to a SpatialPointsDataFrame
coordinates(Biome6000) <- ~Longitude+Latitude
proj4string(Biome6000) <- CRS("+proj=longlat +datum=WGS84")

# Convert the SpatialPointsDataFrame to a terra SpatVector:
coords <- coordinates(Biome6000)
Biome6000_vect <- vect(coords, type = "points", crs = "+proj=longlat +datum=WGS84")

# Attach the original attribute data:
values(Biome6000_vect) <- Biome6000@data

# For each cell, determine the index (i.e., which class) has the highest probability.
hard_class <- which.max(predictions)

# Extract the predicted class (hard classification) at the point locations 

extr <- terra::extract(hard_class, Biome6000_vect)
# The second column of extr holds the index (which.max value)
predicted_index <- extr[, 2]
# Map the index to class names (assumed to be the names of the raster layers)
predicted_class_points <- names(predictions)[predicted_index]

# Filter out points with NA predictions (if any)
valid <- !is.na(predicted_class_points)
predicted_class_points <- predicted_class_points[valid]
observed_class <- values(Biome6000_vect)[, "Biome.6000.Consolidated.Name"]
observed_class <- observed_class[valid]

# Calculate the confusion matrix and extract TPR (Sensitivity)

conf_mat <- confusionMatrix(as.factor(predicted_class_points), as.factor(observed_class))
print(conf_mat)

# Extract TPR (Sensitivity) for each class
tpr_values <- conf_mat$byClass[,"Sensitivity"]
print(tpr_values)

write.csv(extracted_probs, "extracted_probs.csv", row.names = FALSE)
