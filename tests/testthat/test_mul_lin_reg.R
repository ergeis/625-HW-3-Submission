
library(EGeis625)
library(covr)
library(testthat)

my.model1 <- lin_reg(mpg ~ cyl + disp + hp + drat + wt + as.factor(gear), data = mtcars)
my.model2 <- lin_reg(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)
my.model3 <- lin_reg(len ~ as.factor(supp) + dose, data = ToothGrowth)

r.model1 <- lm(mpg ~ cyl + disp + hp + drat + wt + as.factor(gear), data = mtcars)
r.model2 <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)
r.model3 <- lm(len ~ as.factor(supp) + dose, data = ToothGrowth)

test1 <- expect_equal(as.numeric(my.model1$Coefficient), as.numeric(r.model1$coefficients))
test2 <- expect_equal(as.numeric(my.model2$Coefficient), as.numeric(r.model2$coefficients))
test3 <- expect_equal(as.numeric(my.model3$Coefficient), as.numeric(r.model3$coefficients))


