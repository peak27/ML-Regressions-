#   Polinomial Regression

#   Import Packages
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#   Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values #Uppper bound endex not included (to set X as Matrix)
Y = dataset.iloc[:, 2].values

#   Fitting Linear Regression to the dataset
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X, Y)

#   Fitting Polynomial Regression to the dataset
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
X_poly = poly_reg.fit_transform(X)
lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly, Y)

#   Visualizing the Linear REgression results
plt.scatter(X, Y, color = 'red')
plt.plot(X, lin_reg.predict(X), color = 'blue')
plt.title('Truth or Bluff(Linear Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()
 

#    Visualizing Polynomial Regression results

plt.scatter(X, Y, color = 'red')
plt.plot(X, lin_reg_2.predict(poly_reg.fit_transform(X)), color = 'blue')
plt.title('Truth or Bluff(Linear Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()



#   EVen more continous curve
'''X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, Y, color = 'red')
plt.plot(X_grid, lin_reg_2.predict(poly_reg.fit_transform(X_grid)), color = 'blue')
plt.title('Truth or bluff (Cont. Polynomial Regression)')
plt.xlabel('Positions Levels')
plt.ylabel('Salary')
plt.show()'''

#   Predicting  the new salary with Linear Regression
lin_reg.predict(6.5)

#   Predicting the new salary with Polynomial Regression
lin_reg_2.predict(poly_reg.fit_transform(6.5))



