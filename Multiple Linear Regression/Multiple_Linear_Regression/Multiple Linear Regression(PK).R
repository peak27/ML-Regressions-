# Multiple Linear Regression

# Import Dataset

dataset = read.csv('50_Startups.csv')

#Encode Categorical Variable
dataset$State = factor(dataset$State,
                       levels =  c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))


# Splitting Dataset into Training and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Fitting Multiple Linear Regression to the training set

regressor = lm(formula = Profit ~ .,
               data = training_set)

#  Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Bulding the optimal model using Backward Elimination

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend  + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend  ,
               data = dataset)
summary(regressor)








