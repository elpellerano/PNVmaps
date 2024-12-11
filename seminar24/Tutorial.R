list.of.packages <- c("plyr", "terra", "parallel", "plotKML", "GSIF", "ranger", "raster", 
                      "rgdal", "htmlwidgets", "leaflet", "gbm", "nnet", "glmnet", 
                      "doParallel", "dismo", "caret", "devtools", "ggplot2", 
                      "Hmisc", "compositions", "factoextra", "mlr") # added terra package. Will try rewrite all raster(depends on rgdal) functions 
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, dependencies = TRUE)


# load pre-designed functions from repo 
source("R_code/PNV_mapping_functions.R") # external script loaded with rgdal functions..

### load BIOME 6000 data set ###
rm.biome.s <- read.csv(gzfile("Data/Biomes/Biome00k_regression_matrix.csv.gz"))
str(rm.biome.s)
# show summary of target variable
summary(rm.biome.s$Biome00k_c)


### fitting Ranger/Random Forest ###
covs.rm.n <- c("Site.Name","admin0","X","Latitude","Longitude",
               "Biome00k_c","esacci.lc.l4","wdpa","bioclimatic.zones")
covs.rm.lst <- -unlist(sapply(covs.rm.n, function(i){grep(i, names(rm.biome.s))}))
covs.lst <- names(rm.biome.s)[covs.rm.lst]
biome00k.fm <- as.formula(paste("Biome00k_c ~ ", paste0(covs.lst, collapse = "+")))
biome00k.fm
rm.biome.s$Biome00k_c <- as.factor(rm.biome.s$Biome00k_c) # change, ranger requieres specification on data type
m.biome00k <- ranger::ranger(biome00k.fm, rm.biome.s, importance="impurity", 
                             probability=TRUE, num.trees=151, mtry=19, seed = 1)
m.biome00k

### Can we improve RF by cross validation? Testing Performance using Caret Package (CPU intensive) ###

library(caret)
library(doParallel)
cl <- makeCluster(6)
registerDoParallel(cl)
tc <- trainControl(method="repeatedcv", number=5, repeats=2, classProbs=TRUE, 
                   allowParallel=TRUE, verboseIter=TRUE)
tg <- expand.grid(mtry=seq(10, 160, by=8), splitrule=c("gini"), min.node.size=10)
CP.rf <- train(form=biome00k.fm, 
               data=rm.biome.s[complete.cases(rm.biome.s[,all.vars(biome00k.fm)]),], 
               method="ranger", trControl=tc, tuneGrid=tg, na.action=na.omit)
CP.rf
## 0.57
tg2 <- expand.grid(interaction.depth=c(1,2), # Depth of variable interactions
                   n.trees=c(10,20),	        # Num trees to fit
                   shrinkage=c(0.01,0.1),		# Try 2 values for learning rate 
                   n.minobsinnode = 20)
CP.gb <- train(form=biome00k.fm, 
               data=rm.biome.s[complete.cases(rm.biome.s[,all.vars(biome00k.fm)]),], 
               method="gbm", preProc=c("center","scale"), tuneGrid=tg2, trControl=tc, na.action=na.omit)
CP.gb
## 0.52
CP.nn <- train(form=biome00k.fm, 
               data=rm.biome.s[complete.cases(rm.biome.s[,all.vars(biome00k.fm)]),], 
               method="nnet", preProc=c("center","scale"), trControl=tc, na.action=na.omit)
CP.nn
## 0.43
CP.kn <- train(form=biome00k.fm, 
               data=rm.biome.s[complete.cases(rm.biome.s[,all.vars(biome00k.fm)]),], 
               method="kknn", preProc=c("center","scale"), trControl=tc, na.action=na.omit) ### Change: rm.biome to rm.biome s.(error in tutoial script, they confused the variable name)
CP.kn
## 0.51
stopCluster(cl)
closeAllConnections()
biome.results <- resamples(list(ranger=CP.rf, kknn=CP.kn, gbm=CP.gb, nnet=CP.nn))
bwplot(biome.results, fill="grey")
dev.off()

###print results. Note of Author: Comparison of methods to predict PNV biomes could be further extended by using the packages [mlr] 
#or [SuperLearner](also allows for generating ensemble predictions). ###

# Change: Own function for plotting results, as tutorial only shows prefactured plot
biome.results <- resamples(list(ranger = CP.rf, kknn = CP.kn, gbm = CP.gb, nnet = CP.nn))
bwplot(biome.results, main = "Vergleich der Modellgenauigkeit", fill = "lightblue")


#predict values for subset of a 200x200 km tile
grid1km <- readRDS("tiled//T9998/T9998.rds") # define grid (`T9998` covers longitudes 14–16 East and latitudes 48–50 North)
str(grid1km, max.level = 2)

#Predictions by the  trained rangermodel for new spatial data, and inspection of the structure of the predicted probabilities
var.names <- m.biome00k$forest$independent.variable.names # extract list of independent variable names 
grid1km <- grid1km[complete.cases(grid1km@data),] # SpatialPixelsDataFrame, which contains spatial information and covariates :-)
biome1km <- predict(m.biome00k, grid1km@data) # model predicts values for gridfile
str(biome1km) #inspection of structure

# Vegetation class names
attr(biome1km$predictions, "dimnames")[[2]]

grid1km$cool.mixed.forest <- biome1km$predictions[, 
                                                  which(attr(biome1km$predictions, "dimnames")[[2]] == "cool.mixed.forest")]

library(terra)
# Extrahiere die Daten für 'cool.mixed.forest'
cool_mixed_forest_raster <- rast(grid1km["cool.mixed.forest"])

# GeoTIFF-Datei speichern
writeRaster(cool_mixed_forest_raster, 
            filename = "seminar24/output/Biome00k_M_cool.mixed.forest_T9998.tif", 
            filetype = "GTiff", 
            overwrite = TRUE)

# load GeoTIFF
cool_mixed_forest_raster <- rast("Biome00k_M_cool.mixed.forest_T9998.tif")

# define colours
veg_palette <- colorRampPalette(c("lightgreen", "darkgreen"))(50)

# plot GeoTIFF
plot(cool_mixed_forest_raster, 
     main = "Probability of Cool Mixed Forest  ", 
     col = veg_palette)

library(mlr)
rm.biome.s.sp = rm.biome.s[,c("Site.Name","Longitude","Latitude")]
coordinates(rm.biome.s.sp) = ~ Longitude + Latitude
proj4string(rm.biome.s.sp) = "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
## project to metric coordiantes (Mercator projection):
rm.biome.s.sp = spTransform(rm.biome.s.sp, 
                            CRS("+proj=merc +lon_0=0 +lat_ts=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +ellps=WGS84 +towgs84=0,0,0"))
spatial.task.biome <-  makeClassifTask(id = "Site.Name", 
                                       data = rm.biome.s[,all.vars(biome00k.fm)], 
                                       target = "Biome00k_c", 
                                       coordinates = as.data.frame(rm.biome.s.sp@coords))
learner.rf <- makeLearner("classif.ranger", predict.type = "prob")
library("parallelMap")
parallelStartSocket(parallel::detectCores())
resampling <- makeResampleDesc("SpRepCV", fold = 5, reps = 5)
cv.biome.SP <- resample(learner = learner.rf, 
                        task = spatial.task.biome, 
                        resampling = resampling, 
                        measures = list(acc, wkappa))
cv.biome.SP
## Aggregated Result of Author to compare: acc.test.mean=0.3319514,wkappa.test.mean=0.4548447


### ---------------------------------###
### FAPAR part (still in process) ###
# see tutorial for further explanation
rm.fapar.s <- read.csv(gzfile("Data/FAPAR/FAPAR_regression_matrix.csv.gz"))
str(rm.fapar.s)

# building model FAPAR ~ cm + X1m + X2m + X3 + ... + Xp
covs.FAPAR <- readRDS("Data/FAPAR/fm.FAPAR.rds")
fm.FAPAR <- as.formula(paste("FAPAR ~ cMonth + ", 
                             paste0(covs.FAPAR, collapse="+")))
fm.FAPAR

#test performance on a 5% subset
sel.R <- sample.int(nrow(rm.fapar.s), round(nrow(rm.fapar.s)*.05))
m.FAPAR <- ranger::ranger(fm.FAPAR, rm.fapar.s[sel.R,], 
                          importance="impurity", mtry = 29, num.trees=151)
m.FAPAR

# To further detect which covariates are most important we can use:
xl2.P <- as.list(ranger::importance(m.FAPAR))
print(t(data.frame(xl2.P[order(unlist(xl2.P), decreasing=TRUE)[1:20]])))

# generate Predictions for our Map section in Europa
pred_FAPAR(i="T9998", gm=m.FAPAR, tile.tbl=tile.tbl) ### Error, predesigned function from Hengl et al., suspecting crossdependency on rgdal

#creating 12 maps for each months to show photosyntatically active radiation (function is not using own predictions, but prefactured images)
grid1km.F <- list.files("tiled/T9998/", 
                        pattern=glob2rx("FAPAR_*_M_T9998.tif$"), 
                        full.names=TRUE)
m.lst <- c("Jul","Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar","Apr","May","Jun")
m.n <- sapply(m.lst, function(i){grep(i, grid1km.F)})
spplot(as(raster::stack(grid1km.F[m.n]), "SpatialGridDataFrame"), layout=c(6,2),
       names.attr=m.lst)

