
### Plots
library(terra)

# Load raster stack
raster_stack <- rast("predictions_europe_present_final.tif")
plot(raster_stack)

# Hard classification (max probability)
hard_class <- which.max(raster_stack)
hard_class <- as.factor(hard_class)

# Extract actual class names from the stack
class_names <- names(raster_stack)

# Assign levels to the factor raster
levels(hard_class) <- data.frame(ID = 1:length(class_names), class = class_names)
hard_class <- droplevels(hard_class)
levels_present <- levels(hard_class)[[1]]

# 5. Define color scheme (named vector!)
class_colors_named <- c(
  "cold.deciduous.forest"                                 = "darkolivegreen",
  "cold.evergreen.needleleaf.forest"                      = "forestgreen",
  "temperate.deciduous.broadleaf.forest"                  = "saddlebrown",
  "cool.temperate.evergreen.needleleaf.and.mixed.forest"  = "limegreen",
  "cool.temperate.rainforest"                             = "mediumseagreen",
  "cool.evergreen.needleleaf.forest"                      = "green",
  "cool.mixed.forest"                                     = "seagreen",
  "desert"                                                = "lightgrey",
  "erect.dwarf.shrub.tundra"                              = "burlywood",
  "graminoid.and.forb.tundra"                             = "wheat",
  "low.and.high.shrub.tundra"                             = "peru",
  "steppe"                                                = "khaki",
  "warm.temperate.evergreen.broadleaf.and.mixed.forest"   = "mediumaquamarine",
  "temperate.evergreen.needleleaf.open.woodland"          = "mediumspringgreen",
  "xerophytic.woods.scrub"                                = "sienna",
  "temperate.sclerophyll.woodland.and.shrubland"          = "chartreuse",
  "tropical.deciduous.broadleaf.forest.and.woodland"      = "olivedrab",
  "tropical.evergreen.broadleaf.forest"                   = "darkolivegreen",
  "tropical.savanna"                                      = "goldenrod",
  "tropical.semi.evergreen.broadleaf.forest"              = "lightgoldenrod",
  "tundra"                                                = "lightblue"
)

# Match colors to actual present classes, fallback = red
cols <- sapply(levels_present$class, function(cl) {
  if (cl %in% names(class_colors_named)) {
    class_colors_named[cl]
  } else {
    "#FF0000" #just for debugging purposes
  }
})
cols <- unname(cols)
cols
# Plot with robust color assignment
plot(hard_class, col = cols, main = "Hard classification (Present)", maxcell = Inf, colNA = "lightblue")
#legend("topright", legend = levels_present$class, fill = cols, cex = 0.8, bty = "n")

# Save result
writeRaster(hard_class, "hard_class_present.tif", filetype = "GTiff", overwrite = TRUE)
