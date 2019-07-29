# Cluster Analysis

#Kmeans() function
dataname <- data.frame(x,y)
namesdata <- kmeans(dataname, centers = 3) # key parameters are x and centers
names(namesdata) # x here is matrix and centers is integer indicating number of cluster

# looking at teh cluster element returned by function 
namesdata$cluster
# 2 2 2 2 2 1 1 1 1 1 3 3

# Building heatmaps form K-means. It's useful to visualize matrix or array data.

# First find K-means solution
set.seed(1234)
datasolution <- as.matrix(dataname)[sample(1:10),]
namesdata <- kmeans(datasolution , centers = 2) 

# making image plot using the K-means clusters
par(mfrow = c(1,1.5))
image(t(datasolution)[,nrow(datasolution):1], yaxt = "n", main = "Actual Data") # for actual data
image(t(datasolution)[,order(namesdata$cluster)], yaxt = "n", main = "New Data") # for new data

# if it says figure margin too large then change the par()

# Cluster Plots

library(ggfortify)
autoplot(stats::dist(mtcars)) # Visulazing distance matrix

autoplot(stats::prcomp(data_mtcars), 
         data = mtcars, colour ='disp',
         label = TRUE,
         label.size = 2)  # Cluster Plot 

# Plotting cluster package
library(cluster)
autoplot(clara(mtcars[-5], 3))

# drawing convex for each cluster
autoplot(fanny(mtcars[-5], 3), frame = TRUE) # Custer Plot

# creating ellipse
autoplot(pam(iris[-5], 3), 
         frame = TRUE, frame.type = 'norm')
