# File:    Script 2.R
# Course:  UNJ Pesta Day 2
# Session: 4 - Visualizing
# Author:  Thosan Girisona S, bps.go.id, @blankon123
# Date:    2021-09-08

# 1. Load Libraries ################################################
if (!require("pacman"))
  install.packages("pacman")

pacman::p_load(pacman, rio, dplyr, datasets)


# 2. View Dataset ################################################
head(iris)
summary(iris)
plot(iris)

head(mtcars)
summary(mtcars)
plot(mtcars)

# 3. Simple Plot #################################################
?plot  # Help for plot()

plot(iris$Species)  # Categorical variable
plot(iris$Petal.Length)  # Quantitative variable
plot(iris$Species, iris$Petal.Width)  # Cat x quant
plot(iris$Petal.Length, iris$Petal.Width)  # Quant pair
plot(iris)  # Entire data frame

# Plot with options
plot(iris$Petal.Length, iris$Petal.Width,
     col = "#cc0000",  # Hex code for datalab.cc red
     pch = 19,         # Use solid circles for points
     main = "Iris: Petal Length vs. Petal Width",
     xlab = "Petal Length",
     ylab = "Petal Width")

# 4. Plot with Functions ######################################
plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)

# Formula plot with options
plot(dnorm, -3, +3,
     col = "#cc0000",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "z-scores",
     ylab = "Density")

# 5. Bar Chart ######################################
barplot(mtcars$cyl)             # Doesn't work

# Need a table with frequencies for each category
cylinders <- table(mtcars$cyl)
barplot(cylinders)
plot(cylinders)

# 6. Scatter Plot ######################################
# Good to first check univariate distributions
hist(mtcars$wt)
hist(mtcars$mpg)

# Basic X-Y plot for two quantitative variables
plot(mtcars$wt, mtcars$mpg)

# Add some options
plot(mtcars$wt, mtcars$mpg,
     pch = 19,         # Solid circle
     cex = 1.5,        # Make 150% size
     col = "#cc0000",  # Red
     main = "MPG as a Function of Weight of Cars",
     xlab = "Weight (in 1000 pounds)",
     ylab = "MPG")

# 7. Histogram Plot ######################################
hist(iris$Sepal.Length)

# Put graphs in 3 rows and 1 column
par(mfrow = c(3, 1))

# Histograms for each species using options
hist(iris$Petal.Width [iris$Species == "setosa"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Width for Setosa",
     xlab = "",
     col = "red")

hist(iris$Petal.Width [iris$Species == "versicolor"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Width for Versicolor",
     xlab = "",
     col = "purple")

hist(iris$Petal.Width [iris$Species == "virginica"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Width for Virginica",
     xlab = "",
     col = "blue")

# Restore graphic parameter
par(mfrow=c(1, 1))

# . Cleaning Up ########################################
# Clear environment
rm(list = ls())

# Clear console
cat("\014")  # ctrl+L