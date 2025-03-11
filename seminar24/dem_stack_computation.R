library(RSAGA)
library(terra)

saga_cmd()
env <- rsaga.env(path = "seminar24/saga-9.7.2_x64")
dem <- rast("seminar24/data/merged_dem_land.tif")

rsaga.geoprocessor(
  lib = "ta_morphometry", 
  module = "Slope, Aspect, Curvature", 
  param = list(
    ELEVATION = "seminar24/data/merged_dem_land.tif",
    SLOPE = "seminar24/data/slope2.tif"
  ),
  env = env
)

rsaga.geoprocessor(
  lib = "ta_morphometry", 
  module = "Slope, Aspect, Curvature", 
  param = list(
    ELEVATION = "seminar24/data/merged_dem_land.tif",
    C_GENE = "seminar24/data/curvature.tif"
  ),
  env = env
)

rsaga.geoprocessor(
  lib = "ta_hydrology",
  module = "Flow Accumulation (Top-Down)",
  param = list(
    ELEVATION = "seminar24/data/merged_dem_land.tif",
    
    FLOW = "seminar24/data/catchment_area.tif"  # Output file for catchment area
  ),
  env = env
)



rsaga.geoprocessor(
  lib = "ta_hydrology", 
  module = "Topographic Wetness Index",  # Corrected module name
  param = list(
    SLOPE = "seminar24/data/slope2.tif", 
    AREA = "seminar24/data/catchment_area.tif",# Required input
    TWI = "seminar24/data/twi.tif"  # Output TWI file
  ),
  env = env
)


rsaga.geoprocessor(
  lib = "ta_lighting", 
  module = "Topographic Openness", 
  param = list(
    DEM = "seminar24/data/merged_dem_land.tif",
    POS = "seminar24/data/openness_pos.tif",   # Corrected parameter
    NEG = "seminar24/data/openness_neg.tif"    # Corrected parameter
  ),
  env = env
)

rsaga.geoprocessor(
  lib = "ta_channels",
  module = "Valley Depth",
  param = list(
    ELEVATION = "seminar24/data/merged_dem_land.tif",  # Input DEM
    VALLEY_DEPTH = "seminar24/data/valleydepth.tif"   # Corrected output parameter
  ),
  env = env
)

rsaga.geoprocessor(
  lib = "ta_morphometry",
  module = "Multiresolution Index of Valley Bottom Flatness (MRVBF)",  # Corrected name
  param = list(
    DEM = "seminar24/data/merged_dem_land.tif",  # Input DEM
    MRVBF = "seminar24/data/mrvbf.tif"          # Output file
  ),
  env = env
)




