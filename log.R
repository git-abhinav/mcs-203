d = read.csv(file.choose()) # select pollution_with_no_na_and_date_fine from dialog box
x = d[c(11,12,13,14,16,17)]
head(x)

# Create Training Data
input_ones <- x[which(x$Type.of.Location.Binary.form == 1), ]  # all 1's
input_zeros <- x[which(x$Type.of.Location.Binary.form == 0), ]  # all 0's
set.seed(100)  # for repeatability of samples
input_ones_training_rows <- sample(1:nrow(input_ones), 0.8*nrow(input_ones))  # 1's for training
input_zeros_training_rows <- sample(1:nrow(input_zeros), 0.8*nrow(input_zeros))  # 0's for training. Pick as many 0's as 1's
training_ones <- input_ones[input_ones_training_rows, ]  
training_zeros <- input_zeros[input_zeros_training_rows, ]
trainingData <- rbind(training_ones, training_zeros)  # row bind the 1's and 0's 

# Create Test Data
test_ones <- input_ones[-input_ones_training_rows, ]
test_zeros <- input_zeros[-input_zeros_training_rows, ]
testData <- rbind(test_ones, test_zeros)  # row bind the 1's and 0's 

library(rpart)
library(rpart.plot)
library(caret)
library(e1071)
logisReg <- glm(formula = Type.of.Location.Binary.form~., family = binomial(link = "logit"), 
                data = trainingData)
pred <- predict(logisReg, testData, type = "response")
y_pred_num <- ifelse(pred > 0.5, 1, 0)
y_pred <- factor(y_pred_num, levels=c(0, 1))
y_act <- testData$Type.of.Location.Binary.form
mean(y_pred == y_act)
confusionMatrix(table(y_act, y_pred))
