# Exploratory Data Analysis Checklist

library(readr)

# To load CSV file always use .csv at the end of file name
ozone <- read_csv("C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Data files/US EPA data 2017.csv")
View(ozone)

# To check the number of rows and columns
nrow(ozone)
ncol(ozone)

# You can check the data using str() function
str(ozone)

# To look at the begening and end of dataset head() and tail() function can be used
head(ozone)
tail(ozone) # checking end of data helps to find out if there is some comments 

#Filtering data by state name and drilling down to city
table(ozone$`State Name`)

library(dplyr)
filter(ozone, `State Name` == "Arizona") %>%
      select(`City Name`, `County Name`, `Date of Last Change`,`75th Percentile`)

# Counting unique names of state to validate data      
select(ozone, `State Name`) %>% unique %>% nrow

# Looking at the variables to figure out what's wrong
unique(ozone$`State Name`)

# Summary of the data
summary(ozone$`1st Max Value`)

# More detail about data
quantile(ozone$`1st Max Value`, seq(0, 1, 0.1))

# Ranking the state with highest value
ranking <- group_by(ozone, `State Name`,`County Name`) %>%
           summarise(ozone = mean(`1st Max Value`)) %>%
           as.data.frame %>%
           arrange(desc(ozone))
ranking

# Looking at top 10
head(ranking, 10)

#Looking at lowest 10
tail(ranking, 10)

#Filtering to see the count of observation in particular county
filter(ozone, `State Name` == "Alabama" & `County Name` == "Clay") %>% nrow

