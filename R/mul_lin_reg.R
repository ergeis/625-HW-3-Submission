#' Create a linear regression model for the given input
#'
#' @param formula a formula in the form y ~ x where y is the response variable and x is the sum of all of the covariates
#' @param data a data set containing x and y
#' @return Coefficient estimates and their standard errors and p-values for the multiple linear regression model
#' @examples
#' lin_reg(mpg~disp + cyl + hp + drat + wt + as.factor(gear), mtcars)

lin_reg <- function(formula, data) {
  X <- model.matrix(formula, data)
  response_variable <- model.response(model.frame(formula, data))

  # Calculate the coefficients
  beta <- solve(t(X) %*% X) %*% t(X) %*% response_variable

  # Calculate the residuals
  residuals <- response_variable - X %*% beta

  # Degrees of freedom
  df <- nrow(data) - ncol(X)

  # Residual standard error
  rss <- sum(residuals^2)
  residual_std_error <- sqrt(rss / df)

  # Standard errors of the coefficients
  se <- sqrt(diag(solve(t(X) %*% X) * rss / df))

  # t-statistics
  t_stat <- beta / se

  # p-values
  p_values <- 2 * (1 - pt(abs(t_stat), df))

  # Move on to residual standard error
  k <- ncol(X) - 2 #this is the number of coefficients?
  n <- nrow(X)
  resid_std_er <- sqrt(rss/(n-(1+k)))


  results_model <- data.frame(Coefficient = beta, StandardError = se, TStatistic = t_stat, PValue = p_values)
  results_summary <- data.frame(Residual_Standard_Error = resid_std_er)
  print(results_model)
}
