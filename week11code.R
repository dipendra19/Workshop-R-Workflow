
# Principal Component Analysis 

#install.packages("rlang")
# install.packages("ggfortify")
library(ggplot2)
library(ggfortify)
library(rlang)

data_mtcars <- mtcars[c(1:7, 10, 11)]
autoplot(prcomp(data_mtcars))

# PCA works better with numerical data, you can exclude the  categorical variables
View(mtcars) # viewing data to remove categorical variables 
data_mtcars <- mtcars[c(1,2,3,4)]
autoplot(prcomp(data_mtcars))

autoplot(stats::prcomp(data_mtcars), data = mtcars, colour ='disp')

# Using lable = TRUE function dears data lable in rownames
autoplot(stats::prcomp(data_mtcars), 
         data = mtcars, colour ='disp',
         label = TRUE,
         label.size = 2)

# Shape=false removes the point in the plots 

autoplot(stats::prcomp(data_mtcars), 
         data = mtcars, colour ='disp',
        shape = FALSE,
         label.size = 2)

# To draw eigenvectors use function loadings = TRUE
autoplot(stats::prcomp(data_mtcars), 
         data = mtcars, colour ='disp',
       loadings = TRUE)

# For changing options and attaching eignvector
autoplot(stats::prcomp(data_mtcars), 
         data = mtcars, colour ='disp',
         loadings = TRUE, loadings.colour = 'green',
         label = TRUE,
         label.size = 2)

# scale of the componnt are same as standard biplot,
#use sale = 0 to disable scaling

autoplot(stats::prcomp(mtcars), scale = 0)

# Plotting Factor Analysis

d.factanal <- stats::factanal(mtcars, factors = 3, 
                              scores = 'regression')
autoplot(d.factanal)
autoplot(d.factanal, data = mtcars, 
         colour = 'disp')



autoplot(d.factanal, label = TRUE, labele.size = 2,
         loadings = TRUE, loadings.label = TRUE, 
         loadings.label.size = 2)

# Plotting K-means
set.seed(1)
autoplot(kmeans(mtcars, 3), data = mtcars)

autoplot(kmeans(mtcars, 3), data = mtcars,
         label = TRUE, label.size = 3)

# Plotting cluster package
library(cluster)
autoplot(clara(mtcars[-5], 3))

# drawing convex for each cluster
autoplot(fanny(mtcars[-5], 3), frame = TRUE)

# creating ellipse
autoplot(pam(iris[-5], 3), frame = TRUE, frame.type = 'norm')

# Plotting Local Fixher Discriminant Analysis with lfda package
# install.packages("lfda")

library(lfda)
View(iris3)
dat <- lfda(iris[-5], iris[,5], r =3, 
            metric = "plain")
autoplot(dat, data = iris, 
         frame = TRUE, frame.colour = 'Species')

# semi_supervised local fisher discriminant analysis
da <- self(iris[-5], iris[,5], beta= 0.1, r =3, 
            metric = "plain")
autoplot(da, data = iris, 
         frame = TRUE, frame.colour = 'Species')

# Plotting Multidimensional scaling 
#heat map
library(ggfortify)
autoplot(stats::dist(mtcars))

#Heat map for mtcars