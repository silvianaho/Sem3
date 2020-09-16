# -*- coding: utf-8 -*-
"""
Created on Mon May  4 23:15:17 2020

@author: Silviana
"""


import numpy as np
import pandas as pd
from sklearn import datasets

# load the dataset
iris = datasets.load_iris()

# get the data (X) and target (y) (step 1)
X, y = iris.data, iris.target

# split dataset into training and testing sets (step 2)
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.20)

# get the LogisticRegression estimator
from sklearn.linear_model import LogisticRegression

# training the model (step 3)
# apply algorithm to data using fit()
clf = LogisticRegression(solver='newton-cg', multi_class='multinomial')
clf.fit(X_train, y_train)

# We can save the trained model clf using pickle (step 4)
import pickle
s = pickle.dumps(clf)
pickle.dump(clf, open("iris_trained_model.p", "wb"))
clf2 = pickle.load(open("iris_trained_model.p", "rb"))

# Alternatively, we can save the trained model clf with sklearn joblib
from sklearn.externals import joblib
joblib.dump(clf, 'iris_trained_model.pkl')
clf3 = joblib.load('iris_trained_model.pkl')

# Score the model (step 5)
y_hat = clf.predict(X_test)

# Evaluation of the model (step 6)
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_hat)
print(cm)

