# File:    Script 1.R
# Course:  UNJ Pesta Day 2
# Session: 1 - Data Types in R
# Author:  Thosan Girisona S, bps.go.id, @blankon123
# Date:    2021-09-08

# 1. Basic Types ############################################
#Use R just like using normal calculator
1 + 2
2 * 3
2 ^ 3
5 %% 2

#R can have variable, you can insert a value to variable by using '<-'.here are some examples
k <- 5
k
k <- 10 + 1
k
k <- k + 1
k

### Data types ###

#Basic Types
n <- 15
typeof(n)

c <- 'c'
typeof(c)

s <- 'not a character'
typeof(s)

l <- TRUE
typeof(l)
(TRUE | TRUE) & !TRUE


# 2. Complex Types #############################################
v1 <- c(1, 2, 3, 4, 5)
typeof(v1)
is.vector(v1)

v2 <- c(1, 2, 3, 4, TRUE)
typeof(v2)
is.vector(v2)
v2

m1 <- matrix(c(1, 2, 3, 4), nrow = 2)
m1
m1[1, 2]

a1 <- array(c(1:36), c(3, 4, 3))
a1

#Data Frame
vNum <- c(1, 2, 3, 4)
vChar <- c("a", "b", "c", "d")
vLog <- c(TRUE, FALSE, TRUE, FALSE)

df <- cbind(vNum, vChar, vLog)
df
typeof(df)

df <- as.data.frame(cbind(vNum, vChar, vLog))
df

#List
o1 <- c(1, 2, 3)
o2 <- c('a', 'b', 'c', 'd')
o3 <- c(T, T, F, F, T)

list1 <- list(o1, o2, o3)
list1

# 3. Coercion ################################################
(coerce1 <- c(1, "b", TRUE))
typeof(coerce1)

#Numeric to Integer
(coerce2 <- 5)
typeof(coerce2)

(coerce3 <- as.integer(5))
typeof(coerce3)

#Character to Numeric and Vice Versa
(coerce4 <- c("1", "2", "3"))
typeof(coerce4)

(coerce5 <- as.numeric(c("1", "2", "3")))
typeof(coerce5)

(coerce5a <- as.character(coerce5))
typeof(coerce5a)

#Matrix to Data Frame
(coerce6 <- matrix(1:9, nrow = 3))
is.matrix(coerce6)

(coerce7 <- as.data.frame(matrix(1:9, nrow = 3)))
is.data.frame(coerce7)

### Question Time ###

# 4. Factors ##################################################
(x1 <- 1:3)
(y  <- 1:9)

# Combine variables
(df1 <- cbind.data.frame(x1, y))
typeof(df1$x1)
str(df1)

# As Factors
(x2  <- as.factor(c(1:3)))
(y  <- 1:9)

(df2 <- cbind.data.frame(x2, y))
typeof(df2$x2)
str(df2)

(rbind(df2, c(1, 1)))
(rbind(df2, c(5, 1)))

#Factor from dataset
x3  <- c(1:3)
df3 <- cbind.data.frame(x3, y)
df3
(df3$x3 <- factor(df3$x3,
                  levels = c(1, 2, 3)))
typeof(df3$x3)
str(df3)

#Factor with label, kind of SPSS
x4  <- c(1:3)
df4 <- cbind.data.frame(x4, y)
df4$x4 <- factor(df4$x4,
                 levels = c(1, 2, 3),
                 labels = c("macOS", "Windows", "Linux"))
df4
typeof(df4$x4)
str(df4)

#Factor with order
x5  <- c(1:3)
df5 <- cbind.data.frame(x5, y)
(df5$x5 <- ordered(
  df5$x5,
  levels = c(1, 2, 3),
  labels = c("No", "Maybe", "Yes")
))
df5
typeof(df5$x5)
str(df5)

# 5. Cleaning Up ########################################
# Clear environment
rm(list = ls())

# Clear console
cat("\014")  # ctrl+L