### Work and data on the server
library(terra)
library(ranger)

# Load the trained Ranger model from an RDS file
rf_model_prob <- readRDS("ranger_model.rds")


# Extract independent variable names from the Ranger model
model_vars <- ranger_model_prob$finalModel$xNames

# load raster stack (almost 40gb file on the server)
raster_stack <- rast(raster_stack.tif)


# Clean file names:
# Replacing hyphen between years (e.g., "1979-2013") with a period (e.g., "1979.2013")
# Remove the ".tif" extension
clean_names <- names(raster_stack)
clean_names <- gsub("(\\d{4})-(\\d{4})", "\\1.\\2", clean_names)
clean_names <- gsub("\\.tif$", "", clean_names)

names(raster_stack) <- clean_names

print(names(raster_stack))

names(raster_stack) <- model_vars


# Europe extent
ext_europe <- ext(-25, 45, 34, 72)
raster_stack_europe <- crop(raster_stack, ext_europe)

# Predict with Ranger
predictions <- predict(raster_stack_europe, rf_model_prob, type = "response", na.rm = TRUE)

# Save the prediction result as a TIFF file
writeRaster(predictions, "predictions_europe_present.tif", overwrite = TRUE)


# Scaled Shannon Entropy Index (SSEI) - Function
calculate_ssei <- function(probability_stack) {
  # number of classes (b)
  num_classes <- nlyr(probability_stack)
  
  # Basis for Logarithm (b)
  log_b <- log(num_classes)
  
  # no  log(0) through small values
  probability_stack[probability_stack == 0] <- 1e-10
  
  # First part of  SSEI: normalized on b
  entropy_part <- -sum(probability_stack * log(probability_stack) / log_b, na.rm = TRUE)
  
  # second part: correct scale
  correction_term <- (num_classes / (num_classes - 1)) * log((num_classes - 1)) / log_b
  
  # Final SSEI
  ssei <- entropy_part - correction_term
  
  return(ssei)
}



### Work offline

raster_stack <- rast("predictions_europe_present.tif")

plot(raster_stack)
#hard classification
hard_class <- which.max(raster_stack)

# Klassennamen aus den Layer-Namen extrahieren
class_names <- names(raster_stack)

# change into Factor and levels
hard_class <- as.factor(hard_class)
levels(hard_class) <- data.frame(ID = 1:length(class_names), class = class_names)

#cols
cols <- c(
  "darkolivegreen",    # cold.deciduous.forest
  "forestgreen",       # cold.evergreen.needleleaf.forest
  "seagreen",          # cold.mixed.forest
  "green",             # cool.evergreen.needleleaf.forest
  "yellowgreen",       # cool.grassland
  "olivedrab",         # cool.mixed.forest
  "limegreen",         # cool.temperate.evergreen.needleleaf.and.mixed.forest
  "mediumseagreen",    # cool.temperate.rainforest
  "red",               # desert (jetzt rot)
  "burlywood",         # erect.dwarf.shrub.tundra
  "wheat",             # graminoid.and.forb.tundra
  "peru",              # low.and.high.shrub.tundra
  "rosybrown",         # prostrate.dwarf.shrub.tundra
  "khaki",             # steppe
  "saddlebrown",       # temperate.deciduous.broadleaf.forest (neu: besser abgegrenzt)
  "darkgreen",         # temperate.evergreen.needleleaf.forest
  "mediumspringgreen", # temperate.evergreen.needleleaf.open.woodland
  "palegreen",         # temperate.grassland.and.xerophytic.shrubland
  "lightgreen",        # temperate.or.tropical.grassland.and.xerophytic.shrubland
  "chartreuse",        # temperate.sclerophyll.woodland.and.shrubland
  "yellow",            # temperate.xerophytic.woods.scrub
  "olivedrab",         # tropical.deciduous.broadleaf.forest.and.woodland
  "darkolivegreen",    # tropical.evergreen.broadleaf.forest
  "goldenrod",         # tropical.savanna
  "lightgoldenrod",    # tropical.semi.evergreen.broadleaf.forest
  "lightblue",         # tundra
  "mediumaquamarine",  # warm.temperate.evergreen.broadleaf.and.mixed.forest
  "darkorange",        # warm.temperate.evergreen.broadleaf.forest (mediterraner Touch)
  "turquoise",         # warm.temperate.rainforest
  "slateblue",         # wet.sclerophyll.forest
  "sienna"             # xerophytic.woods.scrub
)

# plot
plot(hard_class, col = cols, main = "hard classification", legend.pos = "right")

### Change colours, those are too whackys