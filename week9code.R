# Plotting Systems And Graphics Devices


View(airquality)
library(ggplot2)
data(airquality)
with(airquality, {
        plot(Month, Wind)
        lines(loess.smooth(Month, Wind))
       }) # Trend looks like the wind is low in month of july
# while creating the base plots you can't go backwards so plan in advance.

# constructing a base plot

View(cars)
data(cars)

# creating plot
with(cars, plot(dist, speed))

# Adding title

title("Stopping distance vs. Speed") # use word title to add title

# Lattice System

library(lattice)
View(state.x77)

#relation between income and life expectancy
#scatter plot with 5 panels showing each region seperately
state <- data.frame(state.x77, region = state.region)
xyplot(Income ~ Life.Exp  | region, data = state, layout = c(5,1))

# ggplot2 attempts to overcome the weekness of latic and base system.
# It automatically adds titles and also allows ot annotate.

library(ggplot2)

data(mpg)
qplot(displ, cty, data= mpg) # making scatter plot using ggplot2 and mpg dataset


## Graphics Devices
# With windows() function, windows screen device is launched.
# use qplot while using ggplot2 as default 
# To create a plot use functions like plot, xyplot or qplot

# plot that appears on screen device

with(mpg, plot(displ, cty))

# Anotate with title
title(main = "mpg data") # adding title

# plotting for file device
# open PDF file
pdf(file = "1stpdfplot.pdf")

# creating plot and sending to file
with(mpg, plot(displ, cty))

# Give title to plot
title(main = "First Pdf Plot MPG data")

# closing the PDF file device
dev.off

# Can view pdf file in Workshop-R-Workflow folder in my computer

# you can also copy plots to other device but it will not be same as original.
# some plots requires more coding so copying could be helpfull.
# to copy a plot to PNG file you can use dev.copy(png, file = "copyplot.png")
# you need to close PNG device using dev.off function



