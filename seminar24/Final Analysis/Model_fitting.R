####Model fitting#####
library(ranger)
library(caret)
library(doParallel)


# Function to automatically create a model formula
create_model_formula <- function(data, 
                                 target_col, 
                                 exclude_cols = NULL, 
                                 include_interactions = FALSE) {
  # Ensure target column is not in exclude list
  if(target_col %in% exclude_cols) {
    stop("Target column cannot be in excluded columns")
  }
  
  # Get all column names
  all_cols <- names(data)
  
  # Remove excluded columns and target column
  predictor_cols <- setdiff(all_cols, c(target_col, exclude_cols))
  
  # Create basic formula
  formula_str <- paste(target_col, "~", 
                       paste(predictor_cols, collapse = " + "))
  
  # Optionally add interactions
  if(include_interactions) {
    # Simple pairwise interactions
    interactions <- combn(predictor_cols, 2, 
                          function(x) paste(x[1], x[2], sep = ":"))
    formula_str <- paste(formula_str, 
                         "+", 
                         paste(interactions, collapse = " + "))
  }
  
  return(as.formula(formula_str))
}


# Function to prepare dataset for model training
prepare_model_dataset <- function(data, 
                                  target_col, 
                                  exclude_cols = NULL) {
  # Ensure target column exists
  if(!(target_col %in% names(data))) {
    stop("Target column not found in dataset")
  }
  
  # Create a copy of the dataset
  model_data <- data
  
  # Remove excluded columns
  if(!is.null(exclude_cols)) {
    model_data <- model_data[, !names(model_data) %in% exclude_cols]
  }
  
  # Remove rows with NA in any column
  model_data_clean <- model_data[complete.cases(model_data), ]
  
  return(model_data_clean)
}

#omitting NAs
df_nc <- na.omit(data_cn)

#preparing data for model fit, factors and column names
names(df_nc) <- substr(make.names(names(df_nc)), 1, 20)
colnames(df_nc)[2]<- "Biome.6000.Consolidated.Name"
df_nc$Biome.6000.Consolidated.Name<-droplevels(df_nc$Biome.6000.Consolidated.Name)
df_nc$Biome.6000.Consolidated.Name<-as.factor(df_nc$Biome.6000.Consolidated.Name)


form<-create_model_formula(df_nc, "Biome.6000.Consolidated.Name", c("Site.Name", "Latitude", "Longitude"))
df_nc_mod<-prepare_model_dataset(df_nc, "Biome.6000.Consolidated.Name", c("Site.Name", "Latitude", "Longitude"))
table(df_nc_mod$Biome.6000.Consolidated.Name)
levels(df_nc_mod$Biome.6000.Consolidated.Name) <- make.names(levels(df_nc_mod$Biome.6000.Consolidated.Name))
#parallelizing 
cl <- makeCluster(6)
registerDoParallel(cl)


tc <- trainControl(method = "repeatedcv", 
                   number = 5,       # 5-Fold CV
                   repeats = 2,      # 2 repeats
                   classProbs = TRUE, 
                   allowParallel = TRUE, 
                   verboseIter = TRUE)

# hyperparameter tuning
tg <- expand.grid(mtry = seq(5, 13, by = 2), 
                  splitrule = c("gini"), 
                  min.node.size = c(5,10,15))# min.node.size

# training with  Cross-Validation (Caret)
rf_model <- train(
  form, 
  data = df_nc_mod, 
  method = "ranger", 
  trControl = tc, 
  tuneGrid = tg, 
  importance = "impurity",   # Feature Importance aktivieren
  na.action = na.omit
)


# Parameters after Cross-Validation (mtry 20, nod size 10, 500 trees)
best_mtry <- rf_model_fin$bestTune$mtry
best_min_node_size <- rf_model_fin$bestTune$min.node.size
num_trees <- 500


# Finales Model with probabilities, parameters from cross validation
rf_model_prob <- ranger(
  form, 
  data = df_nc_mod, 
  probability = TRUE,  
  num.trees = num_trees,
  mtry = best_mtry,
  min.node.size = best_min_node_size,
  splitrule = "gini",
  importance = "impurity"
)

stopCluster(cl)
closeAllConnections()

rf_model

# save models
saveRDS(rf_model, "rf_model_fin.rds")

saveRDS(rf_model_prob, "rf_model_prob_fin2.rds")

# save raster stack (40gb or so)



preds <- predict(rf_model_prob_fin, df_nc_mod)
#preds_cl <- as.factor(apply(preds$predictions, 1, which.max))
preds_cl <- as.factor(apply(preds$predictions, 1, function(x) colnames(preds$predictions)[which.max(x)]))
levels(preds_cl)
levels(df_nc_mod$Biome.6000.Cons)
conf_mat <- confusionMatrix(as.factor(preds_cl), df_nc_mod$Biome.6000.Cons)
tpr<- conf_mat$byClass[,"Sensitivity"]

summary(rf_model2)


freq<-table(df_nc_mod$Biome.6000.Cons)
names(freq)<-c()
Table2<-cbind("Biome Class" = names(tpr),tpr,freq)
rownames(Table2)<-NULL
Table2[,1] <- gsub("^.{7}", "", Table2[,1])  # Remove the first 7 characters
Table2[,1] <- gsub("\\.", " ", Table2[,1])  # Replace periods with spaces
Table2[,1] <- tools::toTitleCase(Table2[,1])
Table2[,2]<- substr(Table2[,2], 1, 6)
colnames(Table2)<-c("Biome Class","TPR","Frequency")
 write.csv(Table2, "Table2.csv", row.names = FALSE)

Table2
rf_model_fin
table(df_nc_mod$Biome.6000.Cons)

rf_model_fin
rf_model
