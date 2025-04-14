library(terra)


bio1_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")
bio2_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
bio3_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
bio4_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
bio5_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
bio6_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
bio7_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
bio8_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
bio9_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
bio10_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
bio11_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
bio12_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")
bio13_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_13_2061-2080_V1.2.tif")
bio14_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_14_2061-2080_V1.2.tif")
bio15_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_15_2061-2080_V1.2.tif")
bio16_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_16_2061-2080_V1.2.tif")
bio17_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_17_2061-2080_V1.2.tif")
bio18_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_18_2061-2080_V1.2.tif")
#bio19_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/bio/CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_19_2061-2080_V1.2.tif")

bio_stack_proj <- c(bio1_proj, bio2_proj, bio3_proj, bio4_proj, bio5_proj, bio6_proj, bio7_proj, bio8_proj, bio9_proj, bio10_proj, bio11_proj,
                    bio12_proj, bio13_proj, bio14_proj, bio15_proj, bio16_proj, bio17_proj, bio18_proj)

prec1_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_1_2061-2080.tif")
prec2_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_2_2061-2080.tif")
prec3_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_3_2061-2080.tif")
prec4_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_4_2061-2080.tif")
prec5_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_5_2061-2080.tif")
prec6_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_6_2061-2080.tif")
prec7_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_7_2061-2080.tif")
prec8_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_8_2061-2080.tif")
prec9_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_9_2061-2080.tif")
prec10_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_10_2061-2080.tif")
prec11_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_11_2061-2080.tif")
prec12_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/prec/CHELSA_pr_mon_CanESM2_rcp85_r1i1p1_g025.nc_12_2061-2080.tif")
prec_stack_proj <- c(prec1_proj, prec2_proj, prec3_proj, prec4_proj, prec5_proj, prec6_proj, prec7_proj, prec8_proj, prec9_proj, prec10_proj, prec11_proj, prec12_proj)

tmax1_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")  
tmax2_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
tmax3_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
tmax4_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
tmax5_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
tmax6_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
tmax7_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
tmax8_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
tmax9_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
tmax10_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
tmax11_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
tmax12_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmax/CHELSA_tasmax_mon_CanESM2_rcp85_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")
tmax_stack_proj <- c(tmax1_proj, tmax2_proj, tmax3_proj, tmax4_proj, tmax5_proj, tmax6_proj, tmax7_proj, tmax8_proj, tmax9_proj, tmax10_proj, tmax11_proj, tmax12_proj)

tmean1_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")
tmean2_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
tmean3_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
tmean4_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
tmean5_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
tmean6_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
tmean7_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
tmean8_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
tmean9_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
tmean10_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
tmean11_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
tmean12_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmean/CHELSA_tas_mon_CanESM2_rcp85_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")
tmean_stack_proj <- c(tmean1_proj, tmean2_proj, tmean3_proj, tmean4_proj, tmean5_proj, tmean6_proj, tmean7_proj, tmean8_proj, tmean9_proj, tmean10_proj, tmean11_proj, tmean12_proj)

tmin1_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_1_2061-2080_V1.2.tif")
tmin2_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_2_2061-2080_V1.2.tif")
tmin3_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_3_2061-2080_V1.2.tif")
tmin4_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_4_2061-2080_V1.2.tif")
tmin5_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_5_2061-2080_V1.2.tif")
tmin6_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_6_2061-2080_V1.2.tif")
tmin7_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_7_2061-2080_V1.2.tif")
tmin8_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_8_2061-2080_V1.2.tif")
tmin9_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_9_2061-2080_V1.2.tif")
tmin10_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_10_2061-2080_V1.2.tif")
tmin11_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_11_2061-2080_V1.2.tif")
tmin12_proj<- rast("seminar24/data/Climate_projection/rcp85_61_80/tmin/CHELSA_tasmin_mon_CanESM2_rcp85_r1i1p1_g025.nc_12_2061-2080_V1.2.tif")
tmin_stack_proj <- c(tmin1_proj, tmin2_proj, tmin3_proj, tmin4_proj, tmin5_proj, tmin6_proj, tmin7_proj, tmin8_proj, tmin9_proj, tmin10_proj, tmin11_proj, tmin12_proj)

cov_stack_chelsa_85 <- c(bio_stack_proj, tmin_stack_proj, tmax_stack_proj, tmean_stack_proj,  prec_stack_proj)

ext_europe <- ext(-25, 45, 34, 72)
cov_stack_europe_proj <- crop(cov_stack_proj, ext_europe)

plot(cov_stack_europe_proj$`CHELSA_bio_mon_CanESM2_rcp85_r1i1p1_g025.nc_9_2061-2080_V1.2`)
cov_stack_europe_proj[cov_stack_europe_proj==-32768]<- NA
file_path <- "seminar24/data/cov_eu_proj_NA"

# Export to CSV
writeRaster(cov_stack_europe_proj, filename = file_path, filetype = "GTiff")
plot(co)

plot_raster_stack <- function(raster_stack) {
  tryCatch({
    # Check if the input is a SpatRaster (terra raster object)
    if (!inherits(raster_stack, "SpatRaster")) {
      stop("Input is not a SpatRaster object.")
    }
    
    # Get the number of layers in the stack
    num_layers <- nlyr(raster_stack)
    
    # Plot each layer
    for (i in 1:num_layers) {
      plot(raster_stack[[i]], main = paste("Layer", i))
    }
    
    return("All layers plotted successfully.")
  }, error = function(e) {
    # Return an error message if something goes wrong
    return(paste("Error:", e$message))
  })
}


 plot_raster_stack(cov_stack_europe_proj)

 bio1_eu<-crop(bio1_eu, )
 
 
 
 