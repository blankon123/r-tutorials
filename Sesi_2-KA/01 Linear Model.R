# Sumber:
# https://www.learnbymarketing.com/tutorials/linear-regression-in-r/

dataset = read.csv('https://www.learnbymarketing.com/wp-content/uploads/2014/12/data-marketing-budget-12mo.csv', 
                   header=T, colClasses = c("numeric", "numeric", "numeric"))
head(dataset,5)

plot(dataset$Spend, dataset$Sales)

#/////Simple Regression/////
simple.fit = lm(Sales~Spend+Month,data=dataset)
summary(simple.fit)

plot(dataset$Spend, dataset$Sales)
abline(simple.fit, col=2)

plot(simple.fit)

# penjelasan:
# Estimate: pembobot atau yg kita kenal dengan Beta
# Std.Error: presisi, digunakan untuk menghitung T test, semakin kecil semakin baik karena errorny mendekati nol
# t-value: koefisien / std.error
# pr(>t): tes hipotesis

# 4 Hal penting yang perlu di cek tentang residual setelah membuat linear model
# ----------------------
# 1. The mean of the errors is zero (and the sum of the errors is zero)
# 2. The distribution of the errors are normal.
# 3. All of the errors are independent.
# 4. Variance of errors is constant (Homoscedastic)


#Loading the necessary libraries
# install.packages("lmtest")
# install.packages("fBasics")

library(lmtest) #dwtest
library(fBasics) #JarqueBeraTest

# Uji distribusi normal
shapiro.test(simple.fit$residuals)
jarqueberaTest(simple.fit$resid) #Test residuals for normality
#Null Hypothesis: Skewness and Kurtosis are equal to zero

# Durbin Watson test, cek apakah terdapat autokorelasi
dwtest(simple.fit) #Test for independence of residuals
#Null Hypothesis: Errors are serially UNcorrelated

###############################

#Spend x Residuals Plot
plot(simple.fit$resid~dataset$Spend[order(dataset$Spend)],
     main="Spend x Residuals\nfor Simple Regression",
     xlab="Marketing Spend", ylab="Residuals")
abline(h=0,lty=2)

#Histogram of Residuals
hist(simple.fit$resid, main="Histogram of Residuals",
     ylab="Residuals")

#Q-Q Plot
qqnorm(simple.fit$resid)
qqline(simple.fit$resid)
