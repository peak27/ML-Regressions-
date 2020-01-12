# Decision Tree Regression

# Import the dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting Decision Tree Regression to the dataset
# install.packages('rpart')

library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset, 
                  control = rpart.control(minsplit = 1))
                 
# Predicting a new results
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the Decision Tree Regression results
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')