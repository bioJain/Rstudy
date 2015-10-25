## get the 'iris' dataset
library(datasets)
data(iris)
head(iris)

## using 'dplyr' R package
library(dplyr)

## calculate the mean of 'Sepal.Length' for the species virginica
dat1 = filter(iris, Species == 'virginica')
mean(dat1$Sepal.Length)

## another way to get the mean of 'Sepal.Length' for the species virginica
with(iris, tapply(Sepal.Length, Species, mean))


## R code that returns a vector of the means of 
## the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'
apply(iris[, 1:4], 2, mean)

## get the 'mtcars' dataset
data(mtcars)
head(mtcars)

## calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)
with(mtcars, tapply(mpg, cyl, mean))

## the absolute difference between 
## the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars
mt4 = filter(mtcars, cyl == 4)
mt8 = filter(mtcars, cyl == 8)
abs(mean(mt4$hp)-mean(mt8$hp))
