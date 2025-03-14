library(ranger)
library(caret)
library(doParallel)
library(terra)

# load csv
covariate_matrix <- read.csv("input_raster_present/covariate_matrix.csv")

#remove ID columns
columns_to_remove <- c("ID")  
covariate_matrix <- covariate_matrix[, !(names(covariate_matrix) %in% columns_to_remove)]

# Biome classes as factor (categoric variable)
covariate_matrix$Biome.6000.Consolidated.Name <- as.factor(covariate_matrix$Biome.6000.Consolidated.Name)

# Lithology as factor as well
covariate_matrix$Lit_resampled <- as.factor(covariate_matrix$Lit_resampled)

# formula for model
formula_rf <- as.formula(paste("Biome.6000.Consolidated.Name ~ ", 
                               paste(names(covariate_matrix)[-1], collapse = " + ")))

# 64 corse on the server
num_cores <- 64
cl <- makeCluster(num_cores)
registerDoParallel(cl)

# cross validation
tc <- trainControl(method = "repeatedcv", 
                   number = 5,       # 5-Fold CV
                   repeats = 2,      # 2 repeats
                   classProbs = TRUE, 
                   allowParallel = TRUE, 
                   verboseIter = TRUE)

# hyperparameter tuning
tg <- expand.grid(mtry = seq(10, 160, by = 8), 
                  splitrule = c("gini"), 
                  min.node.size = 10) 

# training with  Cross-Validation (Caret)
rf_model <- train(
  formula_rf, 
  data = covariate_matrix, 
  method = "ranger", 
  trControl = tc, 
  tuneGrid = tg, 
  importance = "impurity",   # Feature Importance aktivieren
  na.action = na.omit
)

# Parameters after Cross-Validation (mtry 20, nod size 10, 500 trees)
best_mtry <- rf_model$bestTune$mtry
best_min_node_size <- rf_model$bestTune$min.node.size
num_trees <- 500


stopCluster(cl)
closeAllConnections()

# Finales Model with probabilities, parameters from cross validation
rf_model_prob <- ranger(
  formula_rf, 
  data = covariate_matrix, 
  probability = TRUE,  
  num.trees = num_trees,
  mtry = best_mtry,
  min.node.size = best_min_node_size,
  splitrule = "gini",
  importance = "impurity"
)

probabilities <- predict(rf_model_prob, data = covariate_matrix)$predictions

# Feature Importance (own ranger function)
importance_values <- importance(rf_model_prob)


print(rf_model_prob)
print("Feature Importance:")
print(importance_values)

# save models
saveRDS(rf_model, "rf_model.rds")

saveRDS(rf_model_prob, "rf_model_prob.rds")

# save raster stack (40gb or so)
writeRaster(raster_stack, "raster_stack.tif", overwrite = TRUE)

