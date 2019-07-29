# Importing, Saving and Managing Data

# Functions for managing workspace

# To display all the objects
ls()

# To remove objects a and b from the workspace
a <- c(1)
b <- c(2)
rm(a, b)
a # object a is removed so error message displayed
# rm is used when you don't need something in your workspace

# TO remove all object in the workspace

## rm(list = ls()) # all objects in the environment is removed

# Important - once you remove an object, you cannot get it back without running the code

# To get current working directory

getwd() #"C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Workshop-R-Workflow"

# To change the working directory 

setwd( "C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Workshop-R-Workflow")

# To return the names of files in WD

list.files() # eg  "week2.Rdata", "Workshop-R-Workflow.Rproj"

# To write object y to textfile called week2.txt

write.table(x, file = "mydata.txt", sep = ",") # for comma seperated file
write.table(x, file = "mydata.txt", sep="\t") # for tab-seperated file

# Save objects a, b to myobjecte.RData

save(a, b, file = "myobject.RData") # saves the all objects in a single file called myobjects.RData

# Example
Team1.df <- data.frame(id= 1:5,
                       sex = c("m","f","f","m","f"),
                       score = c(9, 7, 5, 2, 1))

score.by.sex <- aggregate(score ~ sex,
                          FUN = mean,
                          data = Team1.df)

Team1.htest <- t.test(score ~ sex,
                      data = Team1.df)
   #saving above two objects as a new .RData file
save(Team1.df, score.by.sex, Team1.htest, 
     file = "C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Workshop-R-Workflow/Table1.RData")
# Saved in folder with above path 

#To save all the objects in workspace use save.image () function
save.image(file = "C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Workshop-R-Workflow/projectimage.RData")

# Now projectimage.RData contains all objects in current WD

# To load objects in the file

load(file = "C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Workshop-R-Workflow/projectimage.RData")

# To export data use .txt 
# Use write.table() function 
#Example:

write.table(x = abcde, 
            file = "abcde.txt",  # save file as abcde.txt
            sep = "\t")         # make the columns tab-delimeted

# To read text file read.table() function

Team2 <- read.table(file = "C:/Users/Frank/Desktop/Courses/Exploratory Data Analysis/Workshop-R-Workflow/Table1.RData",
                     sep = '\t', # file is tab-delimited
                     header = TRUE, # first row is a header row
                     stringsAsFactors = FALSE )  # do NOT convert strings to factors

# R uses Working Direcotry(WD) to make storing and searching job easier.

# You will receive error if the object is not in your WD.

# reading files form a web read.table() function

webdata <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)
webdata

# To read non-text file like Stata,SAS and SPSS use package
# install.packages("foreign")
# To read Excel files use package
# install.packages("xlsx")
# It's easy to convert files into simple text first and reading into R with read.table() function.