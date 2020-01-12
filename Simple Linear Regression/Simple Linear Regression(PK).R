#Simple Linear Regrssion

# Importing the Dataset

dataset = read.csv('Salary_Data.csv')

# Spliting Datasets into training and test data
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature scaling is done by the regreession packages so manual scaling is not required

# Fit simple linear regression model to the dataset
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualizing the Training  set results
# install.packages('ggplot2')

library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Years of Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')



#Visualizing test set results

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour =  'blue') +
  ggtitle('Salary Vs Years of Exp (Test Set)') +
  xlab('Years of Exp') +
  ylab('Salary')





