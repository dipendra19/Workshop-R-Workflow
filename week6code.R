# Data Transformation


library(nycflights13)
library(tidyverse)

nycflights13::flights # used here for data manipulation
flights # looking at flight data

View(flights)

# dplyr basics

# filter() to filter data
filter(flights, month ==2, day == 1) #filtering flights for Feburary 1st
feb1 <- filter(flights, month ==2, day == 1)
# To filter july 4th flight and vewing use parenthesis.
(July4 <- filter(flights, month == 7, day == 4 )) 
# for testing equality always use == 
#comparision in R
sqrt(4) ^ 2 == 4
1/9 * 9 == 9

# filtering Multiple arguments using logical operators
# & "and" , | "or", ! "not"
# Flights departing in June or July
filter(flights, month ==6 | month == 7) # need to write month twice

june_july <- filter(flights, month %in% c(6,7))
june_july
# Morgan's law: !(x & y) = !x |!y and !(x|y) = !x & !y
# for finding flights that were not delayed more than hours, use above filters
filter(flights, !(arr_delay > 60 | dep_delay > 60 ))
filter(flights, arr_delay <= 60 , dep_delay <= 60 )

# Missing Values 
is.na(june_july) # to determine missing value

d <- tibble( x = c(2, NA, 4))
filter(d, x > 2 )

filter(d, is.na(x) | x >2)

# arrange() to arrange data by changing order
arrange(flights, month, day, year)
# assecending and decessending order arrangement
arrange(flights, desc(year)) # observing flight data with year decending 

# Storing missing values at the end 
e <- tibble(x = c(7, 6, NA))
arrange(e, x)

arrange(e, desc(x))

# select() to select data
select(flights, month, day, year) # selecting flight with MMDDYY format

select(flights,day:year) # selecting columns between day and year

select(flights, -(day:month)) # selecting columns except between day and year (inclusive)

# To find the name starting form certain letters
select(flights, starts_with("o")) # selects column name with o in flight data set

# ending with certain letters

select(flights, ends_with("m")) # selects comumn name having last letter m

# containing certain letters in word
select(flights, starts_with("or")) 

# rename() allows to rename the variable
rename( flights, tail_num = tailnum)
flights$tailnum

# using select with everyting helper
select(flights, origin, tailnum, everything()) # helps to find origin following with tailnum and everything else

# mutate() to create new variables with function of existing variables
# To create new variable speed
flights_speed <- select(flights, 
                       day:year, 
                       
                       distance,
                       air_time
                       )
          mutate(flights_speed,
               
                 speed = distance / air_time * 60
                 )
#can use coloumn just created
mutate(flights_speed,
       speed = distance / air_time * 60,
       hours = air_time / 60 ,
       speed_per_hour = speed / hours
       ) # to find speed per hour

# use transmute() to keep the new variables 
transmute(flights_speed,
          speed = distance / air_time * 60,
          hours = air_time / 60 ,
          speed_per_hour = speed / hours
          ) # to create new variable speed per hour

#summarise() to provide summary of data
summarise(flights, distance = mean(distance, na.rm = TRUE)) # calculating mean distance
# calculating flights mean distance daily using group by function
daily <- group_by (flights, month, day, year)
summarise(daily, distance = mean(distance, na.rm = TRUE))

# Other summary functions are mean(x), median(x)
# Measure of spread sd(x), IQR(x), mad(x) median absolute deviation
# Measure of rank min(x), quantile(x, 0.50), max(x)
# Measuer of position first(x), nth(x,2),last(x)
# count of non-missing values sum(!is.na(x))
# counting distinct number n_distinct(x)

#Using pipe operator
# flight delay with destination and summary of distance and delay time where destination is not boston
flight_delay <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    distance = mean(distance, na.rm = TRUE),
    delay = mean(dep_delay, na.rm = TRUE)
    ) %>%
  filter(count > 30, dest !="BOS")
  flight_delay
  
