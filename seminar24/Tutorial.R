list.of.packages <- c("plyr", "parallel", "plotKML", "GSIF", "ranger", "raster", 
                      "rgdal", "htmlwidgets", "leaflet", "gbm", "nnet", "glmnet", 
                      "doParallel", "dismo", "caret", "devtools", "ggplot2", 
                      "Hmisc", "compositions", "factoextra", "mlr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, dependencies = TRUE)
