library(terra)
library(dplyr)

str(data)
max(data$Latitude)
    
    #Extend cov_stack to match the target extent
ext_targ<-c(-179, 179, -62.62, 83)
ext(bio_stack)
ext(dem_stack)

cov_stack<-rast(list(bio_stack,tmin_stack,tmax_stack,tmean_stack,prec_stack))
cov_stack<-crop(cov_stack, ext_targ)
bio_stack<-crop(bio_stack, ext_targ)
tmin_stack<-crop(tmin_stack, ext(dem_stack))
tmax_stack<-crop(tmax_stack, ext(dem_stack))
tmean_stack<-crop(tmean_stack, ext(dem_stack))
prec_stack<-crop(prec_stack, ext(dem_stack))


#check extents
ext(cov_stack)
ext(dem_stack)
ext(bio_stack)
ext(tmin_stack)
ext(tmax_stack)
ext(tmean_stack)
ext(prec_stack)




ext(bio_stack)
crop_ib <- function(r) {
  # Define the extent for the Iberian Peninsula (approximate values)
  ib_extent <- ext(-10.0, 4.0, 35.0, 44.0)  # xmin, xmax, ymin, ymax
  return(crop(r, ib_extent))  # Crop the raster using the defined extent
}

bio_stack_ib<-crop_ib(bio_stack)
tmin_stack_ib<-crop_ib(tmin_stack)
tmax_stack_ib<-crop_ib(tmax_stack)
tmean_stack_ib<-crop_ib(tmean_stack)
dem_stack_ib<-crop_ib(dem_stack)
prec_stack_ib<-crop_ib(prec_stack)
cov_stack_ib<-rast(list(bio_stack_ib,tmin_stack_ib,tmax_stack_ib,tmean_stack_ib,prec_stack_ib))
res(cov_stack_ib)

plot(bio_stack_ib$CHELSA_bio10_01)
# dimishing resolution
#factor <- 10  

# Aggregate using mean (or another function like median, min, max)
#cov_stack_ib10<- aggregate(cov_stack_ib, fact = factor, fun = mean, na.rm = TRUE)

# Check new resolution
#res(cov_stack_ib10)



# Define the file path (example path, change to your desired directory)
file_path <- "seminar24/data/cov_ib"

# Export to CSV
write.csv(cov_stack_ib10, file_path, row.names = FALSE)


# cropping dataset

library(dplyr)

# Define the extent for the Iberian Peninsula
xmin <- -10.0
xmax <- 4.0
ymin <- 35.0
ymax <- 44.0

data_ib <-  data %>%
              filter(Longitude >= xmin, Longitude <= xmax, 
                      Latitude >= ymin, Latitude <= ymax)
str(data)

table(data_ib$Biome.6000.Consolidated.Name)
nrow(data_ib)
unique(data_ib$Biome.6000.Consolidated.Name)

# the new datasets has 337 obseravations from 8 different categories, 
#cool-temperate evergreen needleleaf and mixed forest :2 
#cool mixed forest : 3 
#desert : 8 


points_ib <- vect(data_ib, geom = c("Longitude", "Latitude"), crs = crs(cov_stack_ib))

# Extract covariate values at points
cov_values <- extract(cov_stack_ib, points_ib)

# Merge extracted values with the original data_ib
data_ib_f <- bind_cols(data_ib, cov_values)

# Remove duplicated coordinate columns if needed
data_ib_f <- data_ib_f %>% select(-ID)  # 'ID' column is added by extract()

# Check the result
nrow(data_ib_f)
# Define the file path (example path, change to your desired directory)
file_path <- "seminar24/data/data_ib"

# Export to CSV
write.csv(data_ib_f, file_path, row.names = FALSE)




points <- vect(data, geom = c("Longitude", "Latitude"), crs = crs(cov_stack))

# Extract covariate values at points
cov_values <- extract(cov_stack, points)

# Merge extracted values with the original data_ib
data_f <- bind_cols(data, cov_values)

# Remove duplicated coordinate columns if needed
data_f <- data_f %>% select(-ID)  # 'ID' column is added by extract()




points <- vect(data_f, geom = c("Longitude", "Latitude"), crs = crs(dem))

# Extract covariate values at points
cov_values <- extract(dem, points)

# Merge extracted values with the original data_ib
data_f <- bind_cols(data_f, cov_values)

# Remove duplicated coordinate columns if needed
data_f <- data_f %>% select(-ID)  # 'ID' column is added by extract()


points <- vect(data_f, geom = c("Longitude", "Latitude"), crs = crs(slope))

# Extract covariate values at points
cov_values <- extract(slope, points)

# Merge extracted values with the original data_ib
data_f <- bind_cols(data_f, cov_values)

# Remove duplicated coordinate columns if needed
data_f <- data_f %>% select(-ID)  # 'ID' column is added by extract()


str(data_f)




# Check the result
nrow(data_ib_f)
# Define the file path (example path, change to your desired directory)
file_path <- "seminar24/data/data_globe"

# Export to CSV
write.csv(data_f, file_path, row.names = FALSE)




dem_stack$merged_dem_land




