library(terra)

bio1_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")
bio2_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
bio3_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
bio4_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
bio5_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
bio6_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
bio7_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
bio8_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
bio9_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
bio10_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
bio11_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
bio12_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")
bio13_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_13_2061-2080_V1.2.tif")
bio14_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_14_2061-2080_V1.2.tif")
bio15_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_15_2061-2080_V1.2.tif")
bio16_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_16_2061-2080_V1.2.tif")
bio17_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_17_2061-2080_V1.2.tif")
bio18_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_18_2061-2080_V1.2.tif")
bio19_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/bio/CHELSA_bio_mon_CanESM2_rcp45_r1i1p1_g025.nc_19_2061-2080_V1.2.tif")

prec1_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_1_2061-2080.tif")
prec2_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_2_2061-2080.tif")
prec3_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_3_2061-2080.tif")
prec4_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_4_2061-2080.tif")
prec5_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_5_2061-2080.tif")
prec6_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_6_2061-2080.tif")
prec7_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_7_2061-2080.tif")
prec8_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_8_2061-2080.tif")
prec9_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_9_2061-2080.tif")
prec10_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_10_2061-2080.tif")
prec11_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_11_2061-2080.tif")
prec12_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/prec/CHELSA_pr_mon_CanESM2_rcp45_r1i1p1_g025.nc_12_2061-2080.tif")

tmin1_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")
tmin2_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
tmin3_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
tmin4_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
tmin5_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
tmin6_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
tmin7_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
tmin8_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
tmin9_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
tmin10_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
tmin11_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
tmin12_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp45_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")

tmax1_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")
tmax2_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
tmax3_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
tmax4_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
tmax5_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
tmax6_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
tmax7_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
tmax8_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
tmax9_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
tmax10_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
tmax11_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
tmax12_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp45_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")




tmean1_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")
tmean2_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
tmean3_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
tmean4_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
tmean5_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
tmean6_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
tmean7_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
tmean8_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
tmean9_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
tmean10_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
tmean11_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
tmean12_45<-rast("seminar24/data/Climate_projection/rcp45_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp45_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")


bio_stack_45<-c(bio1_45, bio2_45, bio3_45, bio4_45,bio5_45,bio6_45,bio7_45,bio8_45,bio9_45,bio10_45,bio11_45,bio12_45,
                    bio13_45,bio14_45,bio15_45,bio16_45,bio17_45,bio18_45)
tmin_stack_45<-c(tmin1_45,tmin2_45,tmin3_45,tmin4_45,tmin5_45,tmin6_45,tmin7_45,tmin8_45,tmin9_45,tmin10_45,tmin11_45,tmin12_45)
prec_stack45<-c(prec1_45,prec2_45,prec3_45,prec4_45,prec5_45,prec6_45,prec7_45,prec8_45,prec9_45,prec10_45,prec11_45,prec12_45)
tmax_stack_45<-c(tmax1_45,tmax2_45,tmax3_45,tmax4_45,tmax5_45,tmax6_45,tmax7_45,tmax8_45,tmax9_45,tmax10_45,tmax11_45,tmax12_45)
tmean_stack_45<-c(tmean1_45,tmean2_45,tmean3_45,tmean4_45,tmean5_45,tmean6_45,tmean7_45,tmean8_45,tmean9_45,tmean10_45,tmean11_45,tmean12_45)
cov_stack_45<-c(bio_stack_45,tmin_stack_45,tmax_stack_45,tmean_stack_45,prec_stack45)
cov_stack_45eu<-crop(cov_stack_45,ext(-25, 45, 34, 72))
dim(cov_stack_45eu)
names(cov_stack_45eu) <- c(
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

writeRaster(cov_stack_45eu, "seminar24/data/Climate_projection/rcp45_61_80/cov_stack_45eu.tif", overwrite=TRUE)

rf_model(cov_stack)
