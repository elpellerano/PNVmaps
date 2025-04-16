library(terra)
library(ranger)
model$forest$independent.variable.names
model_data<-read.csv("C:/Users/elena/Desktop/Seminar_ClimateNStatistics2425/work/05-naturalveg/data/model_data.csv")
cov_85<-rast("seminar24/data/cov_stack_europe_85.tif")

preds<-predict(cov_85, model, na.rm = TRUE)
write.csv(preds, "seminar24/data/preds_85.csv", row.names = FALSE)

preds<-predict(cov_45, model, na.rm = TRUE)
write.csv(preds, "seminar24/data/preds_45.csv", row.names = FALSE)



colnames(model_data) <- c("Biome.6000.Consolidate.Name",
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

write.csv(model_data, "seminar24/data/model_data.csv", row.names = FALSE)
# Load your model (previously trained and saved)
model <- readRDS("rf_model_prob_fin2.rds")

library(shapviz)
library(kernelshap)
library(ggplot2)
library(patchwork)
library(ranger)
library(doFuture)
library(future)
rf_model_fin
rf_model_prob_fin
# Model
colnames(model_data)
# "mshapviz" object
colnames(df_nc_mod)
options(future.globals.maxSize = 2 * 1024^3)  
future::plan(multisession, workers = 4)  # Adjust number of cores here
doFuture::registerDoFuture()

x <- kernelshap(model, X = model_data[,-1], bg_X = model_data,parallel =TRUE )
shp <- setNames(shapviz(x), levels(iris$Species), )
# all.equal(shp[[3]], shapviz(x, which_class = 3))

sv_importance(shp)

sv_dependence(shp, v = "Sepal.Width") +
  plot_layout(ncol = 2) &
  ylim(-0.06, 0.06)

