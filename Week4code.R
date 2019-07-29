# Matricies and Dataframes, Vectors


#Creating Matirices and dataframes

a<- 6:10
b<- 1:5
c<- 10:15


#cbind for combining vectors as column
#cbind(a, b, c)
cbind(a,b,c)


#rbind for combining vectors as row
# rbind (a,b,c)
rbind(a,b,c)

# To create matrix
# matrix(x, nrow, ncol, byrow)
# Matrix can only have numbers or character vectors if created with number and character everything will be character.
matrix(data = 1:20,
       nrow = 5,
       ncol = 2) 

matrix(data = 1:20,
       nrow = 2,
       ncol = 5)

matrix(data = 1:20,
       nrow = 5,
       ncol = 2,
       byrow = TRUE) 
# To create a dataframe from columns
# data.frame() 
#eg. data.frame("age" = c(1,2), sex = c("m", "f"))
# dataframes can have both strings and numeric vectors
class <- data.frame("student_id" = c(1,2,3,4,5),
                    "sex" = c("m", "f", "m", "f","m"),
                    "age" = c(5, 6, 4, 7, 3))
class

# Use stringAsFactors = FALSE to avoid R assuming and converting string data to factor automatically.
str(class)
# To avoid problem of R assuming and no more factor
class <- data.frame("student_id" = c(1,2,3,4,5),
                    "sex" = c("m", "f", "m", "f","m"),
                    "age" = c(5, 6, 4, 7, 3),
                    stringsAsFactors = FALSE)
class

str(class)

# To see the datasets in dataset package
library(help = "datasets")

#Functions
# head() to look at first few rows 
head(ToothGrowth)


#tail() to look at last few rows 
tail(ToothGrowth)

#View() to open dataset in new window
View(ToothGrowth)

# To count the rows and column
#nrow()
nrow(ToothGrowth)

#ncol()
ncol(ToothGrowth)

#dim()
dim(ToothGrowth)

# To see the names 
#rownames() shows the name of row
rownames(ToothGrowth)

#colnames() shows the name of column
colnames(ToothGrowth)

#names() shows the names of variables
names(ToothGrowth)
# structure and summary of dataframe
#str()
str(ToothGrowth)

#summary() summary statistics
summary(ToothGrowth)
# To select variable in dataframe use df$name
ToothGrowth$len

# To calculate mean
mean(ToothGrowth$len)

table(ToothGrowth$supp)

# To get several column at once by name without using $
head(ToothGrowth[c("len","supp")])

# Adding new column to previous dataframe class
# Adding grade
class$grade <- c("A", "A","A","A","A")

class # After adding grade

# Changing column names from student_id to std_id
names(class)[1] <- "std_id"
class
# To avoid error of selecting column use this syntax
# names(df)[names(df)=="old.name"] <- "new.name"
# changing age to years using above logical indexing
names(class) [names(class)=="age"] <- "years"
class

# Slicing the dataframes or subsetting
# slicing using brackets [,] or selecting specific rows and column
class[1,]
class[,3]
class[1:5, 2]

#Slicing with logical vector
# To return only values whcich is true. return only male from class
class.sex <- class[class$sex == "m", ]
class.sex

# logical vector to return male less than 5 years old
class.year <- class[class$sex == "m" &
                      class$years < 5, ]
class.year

# Using Subset() for slicing
# very useful function for data management in R.
# subset toothgrowth of pigs with tooth less than 20cm and given oj suppliment and dose >1
subset(x= ToothGrowth,
       subset = len < 20 &
                supp == "OJ" &
                dose >= 1)
# if you want certain columns 
subset(x= class,
       subset = years < 5 & sex == "m",
       select = c(std_id, years))
#Combining slicing with functions
# To combine slicing with statistical function
#mean age of student
age_m <- subset(x = class,
                       subset = sex == "m")
mean(age_m$years)

# can also do this using logical indexing
year_m <- class[class$sex == "m", ]
mean(year_m$years)

# we can do this all in one line reffering to column
mean(class$years[class$sex == "m"])

# with() to avoid typing same name again and again
with(class, std_id + years / years + 2 * std_id)
# here we avoid typind class everytime eg class$year, class$std_id







