#Hard Classification

biome_classes <- c(
  "cold.deciduous.forest",
  "cold.evergreen.needleleaf.forest",
  "cold.mixed.forest",
  "cool.evergreen.needleleaf.forest",
  "cool.grassland",
  "cool.mixed.forest",
  "cool.temperate.evergreen.needleleaf.and.mixed.forest",
  "cool.temperate.rainforest",
  "desert",
  "erect.dwarf.shrub.tundra",
  "graminoid.and.forb.tundra",
  "low.and.high.shrub.tundra",
  "prostrate.dwarf.shrub.tundra",
  "steppe",
  "temperate.deciduous.broadleaf.forest",
  "temperate.evergreen.needleleaf.forest",
  "temperate.evergreen.needleleaf.open.woodland",
  "temperate.grassland.and.xerophytic.shrubland",
  "temperate.or.tropical.grassland.and.xerophytic.shrubland",
  "temperate.sclerophyll.woodland.and.shrubland",
  "temperate.xerophytic.woods.scrub",
  "tropical.deciduous.broadleaf.forest.and.woodland",
  "tropical.evergreen.broadleaf.forest",
  "tropical.savanna",
  "tropical.semi.evergreen.broadleaf.forest",
  "warm.temperate.evergreen.and.mixed.forest",
  "warm.temperate.evergreen.broadleaf.and.mixed.forest",
  "warm.temperate.evergreen.broadleaf.forest",
  "warm.temperate.rainforest",
  "wet.sclerophyll.forest",
  "xerophytic.woods.scrub"
)

# empty list for raster layer
raster_list <- list()

# iteration for vegetation types
for (class_name in biome_classes) {
  if (class_name %in% attr(biome1km$predictions, "dimnames")[[2]]) {
    grid1km[[class_name]] <- biome1km$predictions[, 
                                                  which(attr(biome1km$predictions, "dimnames")[[2]] == class_name)
    ]
    raster_layer <- raster(grid1km[class_name])
    raster_list[[class_name]] <- raster_layer
  }
}

# creates stack out of list
raster_stack <- stack(raster_list)

# define colours
veg_palette <- colorRampPalette(c("lightgray", "darkblue"))(10)
library(scico)
scico_palette <- scico(15, palette = "berlin")
plot(
  raster_stack[["temperate.deciduous.broadleaf.forest"]],
  main = "Temperate deciduous broadleaf forest",
  col = veg_palette,
  legend.args = list(text = "Probability", side = 4, line = 2.5),
)

# Generiere eine Palette mit 100 Farben
palette <- brewer.pal(9, "YlGn")
# Beispiel-Plot
plot(
  raster_stack[["cool.mixed.forest"]],
  main = "Cool mixed forest",
  col = veg_palette,
  legend.args = list(text = "Probability", side = 4, line = 2.5)
)
# hard classification (highest pixel value)
grid1km$max_class <- apply(biome1km$predictions, 1, function(row) {
  which.max(row) 
})

grid1km$max_prob <- apply(biome1km$predictions, 1, max) # max probability

# convert in class names
grid1km$max_class_name <- sapply(grid1km$max_class, function(index) {
  attr(biome1km$predictions, "dimnames")[[2]][index]
})

# convert classifcation in raster
hard_classification_raster <- rasterFromXYZ(
  cbind(coordinates(grid1km), grid1km$max_class)
)

# plot classificaiton
plot(
  hard_classification_raster,
  main = "Harte Klassifikation der Vegetationsklassen",
  col = rainbow(length(biome_classes)),
  legend = FALSE
)

# Legend
legend(
  "topright",
  legend = biome_classes,
  fill = rainbow(length(biome_classes)),
  cex = 0.6,
  title = "Vegetationsklassen"
)