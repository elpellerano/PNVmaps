library(terra)
library(dplyr)
library(forcats)
library(ggplot2)
library(sf)

## Biome 6000 #####

# Read the CSV file
data <- read.csv("https://researchdata.reading.ac.uk/99/1/BIOME%206000%20DB%20classified%20plotfile_v1.csv")
table(data$Biome.6000.Consolidated.Name)
# Ensure proper column names 
colnames(data) <- c("Target.age..ka.", "Site.Name", "Latitude", "Longitude", "Biome.6000.Consolidated.Name", "Biome.6000.biome.code", "Biome.4.2.Biome.6000.common.biomes", "MegaBiomes..Scheme.2.", "BIOME.4.2.names.from.model.code", "Biome.4.2.code", "BIOME4.2.BIOME.6000.equivalencies")

# Fix potential UTF-8 issues in the data
data <- data %>% 
  mutate(
    Site.Name = iconv(Site.Name, from = "UTF-8", to = "UTF-8", sub = ""),
    Biome.6000.Consolidated.Name = iconv(Biome.6000.Consolidated.Name, from = "UTF-8", to = "UTF-8", sub = "")
  )%>% filter(Target.age..ka. == 0)

data <- data%>% select(Site.Name, Latitude, Longitude, Biome.6000.Consolidated.Name)

data$Biome.6000.Consolidated.Name<- as.factor(data$Biome.6000.Consolidated.Name)
levels(data$Biome.6000.Consolidated.Name)<-gsub("[- ]", ".", levels(data$Biome.6000.Consolidated.Name))



#DEM and Litography covariates####


dem <- rast("seminar24/data/dem/merged_dem_land.tif")
slope<-rast("seminar24/data/dem/slope_layer.tif")
curvature<-rast("seminar24/data/dem/curvature.tif")
tpi<-rast("seminar24/data/dem/tpi_15.tif")
#lit<-rast("seminar24/data/dem/lit_resampled.tif")

cov_stack_dem<-c(dem, slope, curvature, tpi)

# CHELSA covariates 


####CHELSEA####
bio1<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_01.tif")
bio2<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_02.tif")
bio3<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_03.tif")
bio4<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_04.tif")
bio5<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_05.tif")
bio6<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_06.tif")
bio7<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_07.tif")
bio8<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_08.tif")
bio9<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_09.tif")
bio10<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_10.tif")
bio11<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_11.tif")
bio12<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_12.tif")
bio13<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_13.tif")
bio14<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_14.tif")
bio15<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_15.tif")
bio16<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_16.tif")
bio17<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_17.tif")
bio18<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_18.tif")




##### Temperature #####

tmean1 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_01_1979-2013_V1.2_land.tif")
tmean2 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_02_1979-2013_V1.2_land.tif")
tmean3 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_03_1979-2013_V1.2_land.tif")
tmean4 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_04_1979-2013_V1.2_land.tif")
tmean5 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_05_1979-2013_V1.2_land.tif")
tmean6 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_06_1979-2013_V1.2_land.tif")
tmean7 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_07_1979-2013_V1.2_land.tif")
tmean8 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_08_1979-2013_V1.2_land.tif")
tmean9 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_09_1979-2013_V1.2_land.tif")
tmean10 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_10_1979-2013_V1.2_land.tif")
tmean11 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_11_1979-2013_V1.2_land.tif")
tmean12 <- rast("seminar24/data/CHELSEA/tmean/CHELSA_temp10_12_1979-2013_V1.2_land.tif")

tmin1 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_01_1979-2013_V1.2_land.tif")
tmin2 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_02_1979-2013_V1.2_land.tif")
tmin3 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_03_1979-2013_V1.2_land.tif")
tmin4 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_04_1979-2013_V1.2_land.tif")
tmin5 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_05_1979-2013_V1.2_land.tif")
tmin6 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_06_1979-2013_V1.2_land.tif")
tmin7 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_07_1979-2013_V1.2_land.tif")
tmin8 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_08_1979-2013_V1.2_land.tif")
tmin9 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_09_1979-2013_V1.2_land.tif")
tmin10 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_10_1979-2013_V1.2_land.tif")
tmin11 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_11_1979-2013_V1.2_land.tif")
tmin12 <- rast("seminar24/data/CHELSEA/tmin/CHELSA_tmin10_12_1979-2013_V1.2_land.tif")


tmax1 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_01_1979-2013_V1.2_land.tif")
tmax2 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_02_1979-2013_V1.2_land.tif")
tmax3 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_03_1979-2013_V1.2_land.tif")
tmax4 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_04_1979-2013_V1.2_land.tif")
tmax5 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_05_1979-2013_V1.2_land.tif")
tmax6 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_06_1979-2013_V1.2_land.tif")
tmax7 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_07_1979-2013_V1.2_land.tif")
tmax8 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_08_1979-2013_V1.2_land.tif")
tmax9 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_09_1979-2013_V1.2_land.tif")
tmax10 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_10_1979-2013_V1.2_land.tif")
tmax11 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_11_1979-2013_V1.2_land.tif")
tmax12 <- rast("seminar24/data/CHELSEA/tmax/CHELSA_tmax10_12_1979-2013_V1.2_land.tif")

####precipitation####

prec1<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_01_V1.2_land.tif")
prec2<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_02_V1.2_land.tif")
prec3<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_03_V1.2_land.tif")
prec4<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_04_V1.2_land.tif")
prec5<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_05_V1.2_land.tif")
prec6<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_06_V1.2_land.tif")
prec7<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_07_V1.2_land.tif")
prec8<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_08_V1.2_land.tif")
prec9<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_09_V1.2_land.tif")
prec10<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_10_V1.2_land.tif")
prec11<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_11_V1.2_land.tif")
prec12<-rast("seminar24/data/CHELSEA/prec/CHELSA_prec_12_V1.2_land.tif")


bio_stack <- rast(list(bio1, bio2, bio3, bio4, bio5, bio6, 
                       bio7,bio8,bio9, bio10, bio11, bio12, bio13, bio14, bio15, bio16, bio17, bio18))
tmin_stack <- rast(list(tmin1, tmin2, tmin3, tmin4, tmin5, tmin6, 
                        tmin7, tmin8, tmin9, tmin10, tmin11, tmin12))
tmax_stack <- rast(list(tmax1, tmax2, tmax3, tmax4, tmax5, tmax6, 
                        tmax7, tmax8, tmax9, tmax10, tmax11, tmax12))
tmean_stack <- rast(list(tmean1, tmean2, tmean3, tmean4, tmean5, tmean6, 
                         tmean7, tmean8, tmean9, tmean10, tmean11, tmean12))
prec_stack <- rast(list(prec1, prec2, prec3, prec4, prec5, prec6,
                        prec7, prec8, prec9, prec10, prec11, prec12))

cov_stack_chelsea<-rast(list(bio_stack,tmin_stack,tmax_stack,tmean_stack,prec_stack))
