#!/usr/bin/env python
# coding: utf-8

# In[54]:


import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score


# In[47]:


#data visulaization
TAXLIEN = pd.read_csv(r'E:/Jahnavi/Tax-Lien-Certificate-Sale-Properties (1).csv',index_col=False)
print(TAXLIEN)


# In[48]:



# select variables for the regression analysis
X = TAXLIEN[['LIENS']]
y = TAXLIEN['TOTAL_AMOUNT']

# fit the linear regression model
model = LinearRegression()
model.fit(X, y)

# print the coefficients
print('Intercept:', model.intercept_)
print('Coefficients:', model.coef_)


# In[49]:


#REGRESSION 
#REGRESSION ON  LIENS VALUE AND TOTAL_AMOUNT
x=TAXLIEN.LIENS
y=TAXLIEN.TOTAL_AMOUNT
# Plotting linear regression
linear_regression=np.polyfit(x, y, deg=1)
Y_pred =np.polyval(linear_regression, x)
plt.scatter(x, y)
#plt.plot(x, y)
plt.plot(x, Y_pred, color='GREEN')
plt.xlabel("LIEN")
plt.ylabel("TOTAL_AMOUNT")
plt.show()


# In[50]:



# Calculate the correlation matrix
corr_matrix = TAXLIEN.corr()

# Print the correlation matrix
print(corr_matrix)


# In[51]:


sns.heatmap(corr_matrix, annot=True, cmap='coolwarm')
plt.show()


# In[68]:


# Select the columns SHOWS HIGH ASSESSED_VALUE IN EACH BLOCK 
X = TAXLIEN[['BLOCK']].values
y = TAXLIEN['ASSESSED_VALUE'].values


# Plot the results
plt.scatter(X[:, 0], y, color='blue')
plt.xlabel('BLOCK')
plt.ylabel('ASSESSED_VALUE')
plt.title('BLOCK vs ASSESSED_VALUE')
plt.show()



