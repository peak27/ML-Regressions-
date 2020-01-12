# Polynomial Regression

# Import Dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# Fitting Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

# Fitting Polynomial Regression to the dataset
dataset$level2 = dataset$Level^2
dataset$level3 = dataset$Level^3
dataset$level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Visualizing the Linear Regression Results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)), 
            colour = 'blue') +
  ggtitle('Truth and Bluff (Linear Regression)') +
  xlab('Positions Levels') +
  ylab('Salary')

# Visualizing the Polynomial Regression results
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Polynomial Regression)') +
  xlab('Position Levels') +
  ylab('Salary')

# Predicting  a new result with Linear Regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))

# Predicting a new result with Polynomial Regression
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      level2 = 6.5 ^ 2,
                                      level3 = 6.5 ^ 3,
                                      level4 = 6.5 ^ 4))




