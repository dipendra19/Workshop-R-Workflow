# Model Diagnostics and Missing Data

# Checking Assumptions
# simulating data
simu_1 = function(sample_size = 1000) # Simmulating for sampel size 1000
       {
        x = runif(n = sample_size)*5
        y = 2 + 6 * 5 * x + 
          rnorm( n = sample_size,
          mean = 0,                     # mean is 0
          sd = 1)                       # standard devation is 1
        data.frame(x, y)
}

simu_2 = function(sample_size = 1000)  # simulating for model 2
         {
  x = runif(n = sample_size)*5
  y = 2 + 6 * 5 * x + 
    rnorm( n = sample_size,
           mean = 0,
           sd = x)
  data.frame(x, y) 
}

simu_3 = function(sample_size = 1000)  # simulating for model 3
{
  x = runif(n = sample_size)*5
  y = 2 + 6 * 5 * x + 
    rnorm( n = sample_size,
           mean = 0,
           sd = 1)
  data.frame(x, y)
}

# Using simulation above
# fitted vs residuals plot

set.seed(50)
simu_data_1 = simu_1()
head(simu_data_1)

# fitting the model and adding line to scatterplot

plot( y ~ x, data = simu_data_1, col = "black", pch = 20,
      main = "1st Model")
fit_1 = lm(y~x, data = simu_data_1) # fitting simulation data
abline( fit_1, col = "red", lwd = 2) # to add line and color of line

# Giving name to X axis and Y axis
plot(fitted(fit_1), resid(fit_1), col = "black", pch = 20,
     xlab = "Fit", ylab = "Res", main = "1st Model 1") # Name for x axis , y axis and main heading
abline(h = 0, col = "red", lwd = 2) 

# The mean of resedual should be almost 0 for linearity to become valid.
# We add hoirzontal axis y = 0 for this reason 

set.seed(50)
simu_data_2 = simu_2()
fit_2 = lm(y~x, data = simu_data_2)
plot(y~x, data = simu_data_2, col = "black", pch = 20,
     main = "2nd Model")
abline(h = 0, col = "red", lwd = 2) 


# Model not meeting the linearity assumption
set.seed(50)
simu_data_3 = simu_3()
fit_3 = lm(y~x, data = simu_data_3)
plot(y~x, data = simu_data_3, col = "black", pch = 20,
     main = "3rd Model")
abline(h = 0, col = "red", lwd = 3) 

# Breusch-Pagan Test 
# for testing constant variance assumption

library(lmtest)
# fitting the models from above

bptest(fit_1)
#data:  fit_1
# BP = 3.0995, df = 1, p-value = 0.07832

bptest(fit_2)

bptest(fit_3)

# Histograms

par(mfrow = c(1,1.1))  
hist(resid(fit_1),       # creating histogram for fit_1
     xlab = "Res",       # Name for x axis 
     main = "His_fit_1", # Name for main heading
     col = "blue",       # Colour of histogram 
     border = "black",   #Border line of histograms
     breaks = 20)        # Number of breaks for histogram 
hist(resid(fit_2),
     xlab = "Res",
     main = "His_fit_2",
     col = "blue",
     border = "black",
     breaks = 20)
hist(resid(fit_3),
     xlab = "Res",
     main = "His_fit_3",
     col = "blue",
     border = "black",
     breaks = 20)

# Using Q-Q plot to interpret the normality of errors
# creating Q-Q plot where maing heading is Normal and color is green
# inserting line in Q_Q plot with colour orange and line width 2
qqnorm(resid(fit_1), main = "Normal", col = "green") #
qqline(resid(fit_1), col = "orange", lwd = 2)

# Shapiro_ wiki test 
# for formal testing of residual distribution
set.seed(50)
shapiro.test(rnorm(20))

shapiro.test(rexp(20)) # density distribution function

# maching decisions 

shapiro.test(resid(fit_1))


# Missing Data
install.packages("hflights")
library(hflights)
table(complete.cases(hflights))  # looking for the data with at least one missing data

prop.table(table(complete.cases(hflights)))*100 # looking for the percentage of missing data

sort(sapply(hflights, function(x) sum(is.na(x)))) # looking at the distribution of missing data


                   
