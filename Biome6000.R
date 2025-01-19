library(leaflet)
library(sf)
library(readr)
library(dplyr)
library(RColorBrewer)

# Read the CSV file
data <- read_csv("https://researchdata.reading.ac.uk/99/1/BIOME%206000%20DB%20classified%20plotfile_v1.csv")

# Ensure proper column names (adjust for spaces or unexpected issues if needed)
colnames(data) <- c("Target.age..ka.", "Site.Name", "Latitude", "Longitude", "Biome.6000.Consolidated.Name", "Biome.6000.biome.code", "Biome.4.2.Biome.6000.common.biomes", "MegaBiomes..Scheme.2.", "BIOME.4.2.names.from.model.code", "Biome.4.2.code", "BIOME4.2.BIOME.6000.equivalencies")

# Fix potential UTF-8 issues in the data
data <- data %>% 
  mutate(
    Site.Name = iconv(Site.Name, from = "UTF-8", to = "UTF-8", sub = ""),
    Biome.6000.Consolidated.Name = iconv(Biome.6000.Consolidated.Name, from = "UTF-8", to = "UTF-8", sub = "")
  )

# Filter data (only newest samples)
data <- data %>% filter(Target.age..ka. == 0)

# Convert to a spatial data frame
data_sf <- st_as_sf(data, coords = c("Longitude", "Latitude"), crs = 4326)

# Plot the points on a map
world <- st_as_sf(maps::map("world", plot = FALSE, fill = TRUE))

# Create a dynamic color palette for more than 9 categories
unique_biomes <- unique(data$Biome.6000.Consolidated.Name)
color_palette <- colorFactor(
  palette = colorRampPalette(brewer.pal(9, "Set1"))(length(unique_biomes)),
  domain = unique_biomes
)

# Create a leaflet map
leaflet(data) %>% 
  addTiles() %>% 
  addCircleMarkers(
    lng = ~Longitude, 
    lat = ~Latitude, 
    color = ~color_palette(Biome.6000.Consolidated.Name),
    popup = ~paste("Site Name:", Site.Name, "<br>", "Biome:", Biome.6000.Consolidated.Name, "<br>", "Sample Age (ka):", Target.age..ka.),
    radius = 0.5
  ) %>% 
  addLegend(
    position = "bottomright",
    pal = color_palette,
    values = unique_biomes,
    title = "Biome Type"
  )

