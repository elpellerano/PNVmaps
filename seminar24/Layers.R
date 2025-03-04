library(RSAGA)
library(terra)


getwd()
##### SAGA #####

#env <- rsaga.env(path = "C:/Program Files/SAGA-GIS/saga_cmd")
#myenv <- rsaga.env()

data(dem)
dem$header

dem$data
#write.sgrd(data = dem, file = "dem", header = dem$header, env = env)
#rsaga.slope(in.dem = "dem", out.slope = "slope", method = "poly2zevenbergen")

####CHELSEA####
bio1<-rast("bio/CHELSA_bio10_01.tif")
bio2<-rast("bio/CHELSA_bio10_02.tif")
bio3<-rast("bio/CHELSA_bio10_03.tif")
bio4<-rast("bio/CHELSA_bio10_04.tif")
bio5<-rast("bio/CHELSA_bio10_05.tif")
bio6<-rast("bio/CHELSA_bio10_06.tif")
bio7<-rast("bio/CHELSA_bio10_07.tif")
bio10<-rast("bio/CHELSA_bio10_10.tif")
bio11<-rast("bio/CHELSA_bio10_11.tif")
bio12<-rast("bio/CHELSA_bio10_12.tif")
bio13<-rast("bio/CHELSA_bio10_13.tif")
bio14<-rast("bio/CHELSA_bio10_14.tif")
bio16<-rast("bio/CHELSA_bio10_16.tif")
bio17<-rast("bio/CHELSA_bio10_17.tif")



#####

tmean1 <- rast("tmean/CHELSA_temp10_01_1979-2013_V1.2_land.tif")
tmean2 <- rast("tmean/CHELSA_temp10_02_1979-2013_V1.2_land.tif")
tmean3 <- rast("tmean/CHELSA_temp10_03_1979-2013_V1.2_land.tif")
tmean4 <- rast("tmean/CHELSA_temp10_04_1979-2013_V1.2_land.tif")
tmean5 <- rast("tmean/CHELSA_temp10_05_1979-2013_V1.2_land.tif")
tmean6 <- rast("tmean/CHELSA_temp10_06_1979-2013_V1.2_land.tif")
tmean7 <- rast("tmean/CHELSA_temp10_07_1979-2013_V1.2_land.tif")
tmean8 <- rast("tmean/CHELSA_temp10_08_1979-2013_V1.2_land.tif")
tmean9 <- rast("tmean/CHELSA_temp10_09_1979-2013_V1.2_land.tif")
tmean10 <- rast("tmean/CHELSA_temp10_10_1979-2013_V1.2_land.tif")
tmean11 <- rast("tmean/CHELSA_temp10_11_1979-2013_V1.2_land.tif")
tmean12 <- rast("tmean/CHELSA_temp10_12_1979-2013_V1.2_land.tif")

tmin1 <- rast("tmin/CHELSA_tmin10_01_1979-2013_V1.2_land.tif")
tmin2 <- rast("tmin/CHELSA_tmin10_02_1979-2013_V1.2_land.tif")
tmin3 <- rast("tmin/CHELSA_tmin10_03_1979-2013_V1.2_land.tif")
tmin4 <- rast("tmin/CHELSA_tmin10_04_1979-2013_V1.2_land.tif")
tmin5 <- rast("tmin/CHELSA_tmin10_05_1979-2013_V1.2_land.tif")
tmin6 <- rast("tmin/CHELSA_tmin10_06_1979-2013_V1.2_land.tif")
tmin7 <- rast("tmin/CHELSA_tmin10_07_1979-2013_V1.2_land.tif")
tmin8 <- rast("tmin/CHELSA_tmin10_08_1979-2013_V1.2_land.tif")
tmin9 <- rast("tmin/CHELSA_tmin10_09_1979-2013_V1.2_land.tif")
tmin10 <- rast("tmin/CHELSA_tmin10_10_1979-2013_V1.2_land.tif")
tmin11 <- rast("tmin/CHELSA_tmin10_11_1979-2013_V1.2_land.tif")
tmin12 <- rast("tmin/CHELSA_tmin10_12_1979-2013_V1.2_land.tif")


tmax1 <- rast("tmax/CHELSA_tmax10_01_1979-2013_V1.2_land.tif")
tmax2 <- rast("tmax/CHELSA_tmax10_02_1979-2013_V1.2_land.tif")
tmax3 <- rast("tmax/CHELSA_tmax10_03_1979-2013_V1.2_land.tif")
tmax4 <- rast("tmax/CHELSA_tmax10_04_1979-2013_V1.2_land.tif")
tmax5 <- rast("tmax/CHELSA_tmax10_05_1979-2013_V1.2_land.tif")
tmax6 <- rast("tmax/CHELSA_tmax10_06_1979-2013_V1.2_land.tif")
tmax7 <- rast("tmax/CHELSA_tmax10_07_1979-2013_V1.2_land.tif")
tmax8 <- rast("tmax/CHELSA_tmax10_08_1979-2013_V1.2_land.tif")
tmax9 <- rast("tmax/CHELSA_tmax10_09_1979-2013_V1.2_land.tif")
tmax10 <- rast("tmax/CHELSA_tmax10_10_1979-2013_V1.2_land.tif")
tmax11 <- rast("tmax/CHELSA_tmax10_11_1979-2013_V1.2_land.tif")
tmax12 <- rast("tmax/CHELSA_tmax10_12_1979-2013_V1.2_land.tif")









