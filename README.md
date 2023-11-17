# 625-HW-3-Submission
This is my submission for Biostat 625 HW 3

Included in this repository is an r package called "EGeis625" which contains a function called "lin_reg". This function will run and report a simple or multiple linear regression model based on the input given to the 
function. The two inputs for lin_reg are "formula" and "data" (resulting in the command lin_reg(formula, data)). The 'formula' input is in the form y ~ x where y is the outcome of interest in the model and x is
either one or multiple relevant covariates of interest. The 'data' input is the name of the dataframe that contains the outcome variable and the covariate data. 
The lin_reg function can also handle categorical variables that should be treated as factors instead of continous variables. The function will automatically select one value of the categorical variable to be the 
baseline value and create factors for each of the remaining values of the categorical variable. To use this feature, include the prefix as.factor() around the categorical covariate. 
The function uses linear algebra and matrix multiplication to report the coefficient estimates, their associated test statistics and p-values, as well as each coefficient's standard errors. First, a design matrix is
created for the model using the model.matrix function, and the outcome variable is extracted using model.outcome. We can then solve the formula 
