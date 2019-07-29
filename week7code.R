# Data Visualisation

library(tidyverse)

# using mpg data frame
mpg
View(mpg)

# plotting mpg 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty , y= displ )) # geom_point helps to create scatterplot
#aes defines the axes x and y 
# visual property of objects is called aesthetic
# use class to give collor to category of cars

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty , y= displ , colour = class )) # ggplot assigning unique colour to unique value of variable is known as scaling.

#Mapping to alpha and shape aesthetic
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty , y= displ , alpha = class )) # not advised for discrete variable
ggplot(data = mpg) + 
 geom_point(mapping = aes(x = cty , y= displ , shape = class )) # not good for more than 6 descrete value

# choosing colour manually

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty , y= displ , color = "red" )) 

# using facet or subplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty , y= displ )) +
  facet_wrap( ~ class, nrow = 3) # nrwo defines how many rows of plot you want 

# to facet plot into tow variables add grid seperated by tilda
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty , y= displ )) +
  facet_grid(cyl ~ drv) # if facet is not required use . instead of column name

# geometrical object use to represent data is called geoms. eg. Barchart uses bar geom
#geom_smooth is used to fit smooth line in data

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = cty , y= displ, linetype = fl))

#displaying multiple geoms in single plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty , y= displ)) +
  geom_smooth(mapping = aes(x = cty , y= displ))

# displaying aesthetics in layers
ggplot(data = mpg, mapping = aes(x = cty , y= displ)) + 
  geom_point(mapping = aes(color = class)) +
  geom_smooth()

# filtering midsize
ggplot(data = mpg, mapping = aes(x = cty , y= displ)) + 
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "midsize"), se = FALSE)

# Looking at dimonds data set
View(diamonds)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity))

#colouring bar chart
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, fill = clarity))

# Stacking 
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, fill = cut))

#position adjustment for stacking
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "dodge")

#switching the x and y axis

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, fill = clarity)) +
  coord_flip()

# bar chart and combo chart
bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = clarity, fill = clarity),
    show.legend = FALSE,
    width = 2
  ) +
  theme(aspect.ratio = 2) +
  labs(x = NULL, y = NULL)

  bar + coord_flip()
  bar + coord_polar()
  


