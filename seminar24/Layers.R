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
bio1<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_01.tif")
bio2<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_02.tif")
bio3<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_03.tif")
bio4<-rast("seminar24/data/CHELSEA/bio/CHELSA_bio10_04.tif")
bio5<-rast("seminar24/data/CHELSEA/bio/CHELSEA_bio10_05.tif")
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










####Worldclimate temperature #####




#### MODIS CLoud coverage #####

cloudcov1<-rast("seminar24/data/MODIS/MODCF_monthlymean_01.tif")
cloudcov2<-rast("seminar24/data/MODIS/MODCF_monthlymean_02.tif")
cloudcov3<-rast("seminar24/data/MODIS/MODCF_monthlymean_03.tif")
cloudcov4<-rast("seminar24/data/MODIS/MODCF_monthlymean_04.tif")
cloudcov5<-rast("seminar24/data/MODIS/MODCF_monthlymean_05.tif")
cloudcov6<-rast("seminar24/data/MODIS/MODCF_monthlymean_06.tif")
cloudcov7<-rast("seminar24/data/MODIS/MODCF_monthlymean_07.tif")
cloudcov8<-rast("seminar24/data/MODIS/MODCF_monthlymean_08.tif")
cloudcov9<-rast("seminar24/data/MODIS/MODCF_monthlymean_09.tif")
cloudcov10<-rast("seminar24/data/MODIS/MODCF_monthlymean_10.tif")
cloudcov11<-rast("seminar24/data/MODIS/MODCF_monthlymean_11.tif")
cloudcov12<-rast("seminar24/data/MODIS/MODCF_monthlymean_12.tif")


# the chelsea and modis cloud coverage are already on the same grid 
res(bio1)
ext(bio1)
dim(bio1)
crs(bio1)

res(tmin1)
ext(tmin1)
dim(tmin1)
crs(tmin1)

res(cloudcov1)
ext(cloudcov1)
dim(cloudcov1)
crs(cloudcov1)
plot(bio1)



#####Cropping to the iberic region #####
e <- ext(-10, 5, 36, 51)  # xmin, xmax, ymin, ymax

# Crop the raster to this extent
bio1_ib <- crop(bio1, e)

# Plot to check the result
plot(bio1_ib)

#### dem #####


library(RSAGA)
rsa.env <- rsaga.env()


df <- as.data.frame(bio1, xy = TRUE)


