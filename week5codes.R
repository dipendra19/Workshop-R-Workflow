# Tidy Data

#We are using 
library(tidyverse)

religion_income <- read_csv("C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Data files/religion_income.csv")
View(religion_income)

#organizing data in different form 
table1
table2
table3
table4a
table4b
# For data to be tidy each variables needs to be in one column
# Each observation needs to be in its own row and value must have its own cell
#Mutate to add new variable and prevent existing one
table1%>%
  mutate(rate = cases / population * cases)

# Count cases per year
table1%>%
  count(year, wt = cases)


# Visulasing change

library(ggplot2)
ggplot(table1, aes(year, cases)) +
    geom_line(aes(group = country), colour = "grey55") + 
    geom_point(aes(colour = country))


#Gathering is done to solve the problem of data spread accross multiple columns and rows


table4b%>%
    gather(`1999`, `2000`, key = "year", value = "cases")

table4a%>%
  gather(`1999`, `2000`, key = "year", value = "Population")

# like SQL we can use join to combine two tidy data tables
tidy4a <- table4a%>%
  gather(`1999`, `2000`, key = "year", value = "Population")

tidy4b <- table4b%>%
  gather(`1999`, `2000`, key = "year", value = "cases")

left_join(tidy4a, tidy4b)

# Spreading is used when observation is scattered accross 

table2
table2 %>%
  spread(key = type, value = count)

# Seperate function is used when multiple columns has single variables

table3
table3 %>%
  separate(rate, into = c("cases", "population"))
#OR 
table3 %>%
  separate(rate, into = c("cases", "population"), sep="/")

#Seperate has default behaviour of leaving types as character.
# To convert it to better type eg integer for calculation use 
table3 %>%
  separate(rate, into = c("cases", "population"), convert = TRUE)

# UNITE is to combine multiple columns into one
table5

table5%>%
  unite(new, century, year)

# To avoid getting output like 19_99 use sep argument

table5%>%
  unite(new, century, year, sep="") #we don't want seperator so sep =""

# Missing Values

product <- tibble(
      year = c(2011, 2012, 2011, 2013,2014, 2015, 2014 ),
      qrt  = c(1, 2, 3, 4, 3, 2, 1),
      return = c(0.89, 0.95, 1.98, NA, 0.90, 0.15
                ))

product%>%
  spread(year, return)

# fill function to use most recent non-missing value
procucts%>%
fill (person)

