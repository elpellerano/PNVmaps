library(terra)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(dplyr)
library(tidyr)
library(forcats)

####Reclassification #####

#reclassiing biomes with too few observations into similiar classes or removing 
#those with less than 5 
table(data_c$Biome.6000.Consolidated.Name)
data_c <- data %>%
  filter(!Biome.6000.Consolidated.Name %in% c("wet.sclerophyll.forest", "cool.grassland", "temperate.xerophytic.woods/scrub")) %>%
  mutate(Biome.6000.Consolidated.Name = droplevels(Biome.6000.Consolidated.Name)) %>%
  mutate(Biome.6000.Consolidated.Name= fct_collapse(Biome.6000.Consolidated.Name, 
                                                    "temperate.deciduous.broadleaf.forest" = c("temperate.deciduous.broadleaf.forest", "cold.mixed.forest", "temperate.evergreen.needleleaf.forest"),
                                                    "xerophytic.woods/scrub"=c("xerophytic.woods/scrub","temperate.grassland.and.xerophytic.shrubland", "temperate.or.tropical.grassland.and.xerophytic.shrubland"),
                                                   "warm.temperate.evergreen.broadleaf.and.mixed.forest"= c("warm.temperate.evergreen.broadleaf.and.mixed.forest","warm.temperate.evergreen.broadleaf.forest", "temperate.evergreen.needleleaf.forest"),
                                                    "erect.dwarf.shrub.tundra"=c("erect.dwarf.shrub.tundra", "prostrate.dwarf.shrub.tundra"),
                                                    "cool.temperate.rainforest"=c("cool.temperate.rainforest", "warm.temperate.rainforest")
                                                   
  ))
names(cov_stack_europe) <- c(
  "merged_dem_land", "slope_layer", "curvature", "tpi",
  "CHELSA_bio10_01", "CHELSA_bio10_02", "CHELSA_bio10_03", "CHELSA_bio10_04", "CHELSA_bio10_05", 
  "CHELSA_bio10_06", "CHELSA_bio10_07", "CHELSA_bio10_08", "CHELSA_bio10_09", "CHELSA_bio10_10", 
  "CHELSA_bio10_11", "CHELSA_bio10_12", "CHELSA_bio10_13", "CHELSA_bio10_14", "CHELSA_bio10_15", 
  "CHELSA_bio10_16", "CHELSA_bio10_17", "CHELSA_bio10_18",
  "CHELSA_tmin10_01_197", "CHELSA_tmin10_02_197", "CHELSA_tmin10_03_197", "CHELSA_tmin10_04_197", 
  "CHELSA_tmin10_05_197", "CHELSA_tmin10_06_197", "CHELSA_tmin10_07_197", "CHELSA_tmin10_08_197", 
  "CHELSA_tmin10_09_197", "CHELSA_tmin10_10_197", "CHELSA_tmin10_11_197", "CHELSA_tmin10_12_197", 
  "CHELSA_tmax10_01_197", "CHELSA_tmax10_02_197", "CHELSA_tmax10_03_197", "CHELSA_tmax10_04_197", 
  "CHELSA_tmax10_05_197", "CHELSA_tmax10_06_197", "CHELSA_tmax10_07_197", "CHELSA_tmax10_08_197", 
  "CHELSA_tmax10_09_197", "CHELSA_tmax10_10_197", "CHELSA_tmax10_11_197", "CHELSA_tmax10_12_197", 
  "CHELSA_temp10_01_197", "CHELSA_temp10_02_197", "CHELSA_temp10_03_197", "CHELSA_temp10_04_197", 
  "CHELSA_temp10_05_197", "CHELSA_temp10_06_197", "CHELSA_temp10_07_197", "CHELSA_temp10_08_197", 
  "CHELSA_temp10_09_197", "CHELSA_temp10_10_197", "CHELSA_temp10_11_197", "CHELSA_temp10_12_197", 
  "CHELSA_prec_01_V1.2_", "CHELSA_prec_02_V1.2_", "CHELSA_prec_03_V1.2_", "CHELSA_prec_04_V1.2_", 
  "CHELSA_prec_05_V1.2_", "CHELSA_prec_06_V1.2_", "CHELSA_prec_07_V1.2_", "CHELSA_prec_08_V1.2_", 
  "CHELSA_prec_09_V1.2_", "CHELSA_prec_10_V1.2_", "CHELSA_prec_11_V1.2_", "CHELSA_prec_12_V1.2_"
)



# extracting covariate values for each observation, 
#when a value is not found we look in a range of up to 5km to find the nearest value
extract_nearest <- function(raster_stack, points, max_distance = 5000) {
  # First try exact extraction
  extracted_values <- terra::extract(raster_stack, points)
  
  # Identify rows with NA values
  na_rows <- which(is.na(extracted_values[,2]))
  
  if(length(na_rows) > 0) {
    # Create a spatial vector of just the NA points
    points_na <- points[na_rows]
    
    # Loop through NA rows to find nearest point
    for(i in seq_along(na_rows)) {
      # Create a buffer around the point
      buffer <- terra::buffer(points_na[i], width = max_distance)
      
      # Try to extract values within the buffer
      buffer_extract <- terra::extract(raster_stack, buffer)
      
      # Remove NA values from buffer extraction
      valid_extracts <- buffer_extract[!is.na(buffer_extract[,2]),]
      
      if(nrow(valid_extracts) > 0) {
        # If valid extracts exist, replace the NA value
        extracted_values[na_rows[i],] <- valid_extracts[1,]
      }
    }
  }
  
  return(extracted_values)
}

#eliminating samples in same locations, only keeping 2 samples when they have equal frequency
data_cn <- data_c %>%
  group_by(Site.Name, Biome.6000.Consolidated.Name) %>%
  summarise(Count = n(), .groups = "drop") %>%
  group_by(Site.Name) %>%
  filter(Count == max(Count)) %>%
  select(Site.Name, Biome.6000.Consolidated.Name) %>%
  left_join(
    data_c %>%                                   
      select(Site.Name, Latitude, Longitude) %>%
      distinct(),
    by = "Site.Name"
  )



#only keeping northen emisphere
#data_cn<- data_cn %>%
#  filter(Latitude >= 0)

#extracting points in dataset
points <- vect(data_cn, geom = c("Longitude", "Latitude"), crs = "EPSG:4326")

#extracting points from the covariates raster, with a radius of 5 km for missing values
extr_dem<-extract_nearest(cov_stack_dem, points)[,-1]
extr_chels<-extract_nearest(cov_stack_chelsea, points)[,-1]
colnames(extr_dem)[4]<-"tpi"

df_nc_mod<-df_nc_mod[,-6]

colnames(extr_dem)
#joining the datasets
data_cn <- cbind(data_cn, extr_dem, extr_chels)
colnames(data_cn)
data_cn<-data_cn[,-9]

####Model fitting#####
library(caret)
library(doParallel)

rf_model_prob_fin

# Function to automatically create a model formula
create_model_formula <- function(data, 
                                 target_col, 
                                 exclude_cols = NULL, 
                                 include_interactions = FALSE) {
  # Ensure target column is not in exclude list
  if(target_col %in% exclude_cols) {
    stop("Target column cannot be in excluded columns")
  }
  
  # Get all column names
  all_cols <- names(data)
  
  # Remove excluded columns and target column
  predictor_cols <- setdiff(all_cols, c(target_col, exclude_cols))
  
  # Create basic formula
  formula_str <- paste(target_col, "~", 
                       paste(predictor_cols, collapse = " + "))
  
  # Optionally add interactions
  if(include_interactions) {
    # Simple pairwise interactions
    interactions <- combn(predictor_cols, 2, 
                          function(x) paste(x[1], x[2], sep = ":"))
    formula_str <- paste(formula_str, 
                         "+", 
                         paste(interactions, collapse = " + "))
  }
  
  return(as.formula(formula_str))
}


# Function to prepare dataset for model training
prepare_model_dataset <- function(data, 
                                  target_col, 
                                  exclude_cols = NULL) {
  # Ensure target column exists
  if(!(target_col %in% names(data))) {
    stop("Target column not found in dataset")
  }
  
  # Create a copy of the dataset
  model_data <- data
  
  # Remove excluded columns
  if(!is.null(exclude_cols)) {
    model_data <- model_data[, !names(model_data) %in% exclude_cols]
  }
  
  # Remove rows with NA in any column
  model_data_clean <- model_data[complete.cases(model_data), ]
  
  return(model_data_clean)
}

#omitting NAs
df_nc <- na.omit(data_cn)

#preparing data for model fit, factors and column names
names(df_nc) <- substr(make.names(names(df_nc)), 1, 15)
colnames(df_nc)
table(df_nc$Biome.6000.Cons)
df_nc$Biome.6000.Cons<-droplevels(df_nc$Biome.6000.Cons)
df_nc$Biome.6000.Cons<-as.factor(df_nc$Biome.6000.Cons)
levels(df_nc_mod$Biome.6000.Cons) <- make.names(levels(df_nc_mod$Biome.6000.Cons))
table(df_nc$Biome.6000.Cons)

form<-create_model_formula(df_nc, "Biome.6000.Cons", c("Site.Name", "Latitude", "Longitude"))
df_nc_mod<-prepare_model_dataset(df_nc, "Biome.6000.Cons", c("Site.Name", "Latitude", "Longitude"))
write.csv(df_nc_mod, "model_data.csv", row.names = FALSE)

colnames(df_nc_mod)



cl <- makeCluster(10)
registerDoParallel(cl)
tc <- trainControl(method="repeatedcv", number=5, repeats=2, classProbs=TRUE, 
                   allowParallel=TRUE, verboseIter=TRUE)
tg <- expand.grid(mtry=seq(4, 12, by=1), splitrule=c("gini"), min.node.size=seq(5,20, by=5))
tg <- expand.grid(mtry=seq(4, 14, by=1), splitrule=c("gini"), min.node.size=(10))
CP.rf <- train(form=form, 
               data=df_nc_mod,  
               method="ranger", trControl=tc, tuneGrid=tg, na.action=na.omit)
CP.rf
CP.rfn

df_ncM

preds2 <- predict(CP.rf, df_nc_mod)
conf_mat2 <- confusionMatrix(preds2, df_nc_mod$Biome.6000.Cons)
tpr <- conf_mat2$byClass["Sensitivity"]
conf_mat2$byClass[,"Sensitivity"]

print(conf_mat)
print(tpr)

levels(df_nc_mod$Biome.6000.Cons)[]