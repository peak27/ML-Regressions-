#  Prashant Karki
# Simple Linear Regression in Python.

#   Begin with importing the required libraries.
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


#   Importing the dataset and
#   Declaring Independent(X) and Dependent (Y) Variables
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
Y = dataset.iloc[:, 1].values

#   Splitting the dataset into  training and testing sets
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 1/3)

# Fitting the linear regression model to the dataset
from sklearn.linear_model import LinearRegression
linreg = LinearRegression()
linreg.fit(X_train, Y_train)

# Predicting new results using test set
y_pred = linreg.predict(X_test)

#    Visualizing fitted linear regression model to training set results
plt.scatter(X_train, Y_train, color = 'blue')
plt.plot(X_train, linreg.predict(X_train), color = 'red')
plt.title('Salary Vs. Years of Experience (Training set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()

#   Visualizing fitted linear regression model to test set results

plt.scatter(X_test, Y_test, color = 'blue')
plt.plot(X_train, linreg.predict(X_train), color = 'red')
plt.title('Salary Vs Years of Experience(Test set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()















