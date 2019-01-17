<<<<<<< HEAD
# Chapter 3 Setup and Functions ------------------------------------------------


# good practise to have all data file for a project in the same relative folder, that way the script can be used by
# anyone aslong as the files are in the same project folder

setwd("F:/Projects/systemsbio/R/theRbook/")

rt <- function(x) read.table( paste( "data_files//",x,".txt", sep = ""), header = T)
# read.table function in the format rt("file_name") to impoert .txt file as dataframe



getwd()
list

# 3.1 Data input for the keyboard ------------------------------------

x <- scan() # input individual numbers in to vector in console
# you can alos paste dictectly into the input

# 3.2 Data input for files -------------------------------------------

dir("F://")

data <- read.table( file.choose(), header = T)
head(data)

data <- read.table('yield.txt', header = T)
head(data)

data <- read.delim('yield.txt')
head(data)
data()

rt("yield")

# default  sep =" " whit spaxce whic means a number of spaces, tabs or carridge-returns. to read a comma delimiated 
# file use read.csv and read.csv2 for semicolon

# may add row.names and the coloumn number if one column contains unquire row names, otherwise numbers are added

# The default behaviour of read.table is to convert character variables into factors. If you do not want
# this to happen (you want to keep a variable as a character vector) then use as.is to specify the columns that
# should not be converted to factors


data2 <- read.table ("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/cancer.txt", header = T)
head(data2)

# 3.3 Input from files using scan --------------------------------------


rt("rt") # error de to diffent lines contianing differnt numbers of fields

# scan will work better wiht untidy dataframe such as this - but you will wish to skip the header row as this contains
# names not data with (skip = 1)
# if data is spread across multiple lines use multi.line = TRUE

scan("data_files//worms.txt", skip = 1, what = as.list( rep("", 7))) 
worms_data <- as.data.frame( scan("data_files//worms.txt", skip = 1, what = as.list( rep("", 7)))) # imports a dataframe
header <- unlist( scan("data_files//worms.txt", nlines = 1, what = as.list( rep("", 7)))) # separates the origional names
names(worms_data) <- header # replaces names with the headernames
head(worms_data)

scan("data_files//rt.txt") # 10 items
scan("data_files//rt.txt", sep = "\n") # 5 item using a new line as a seperator
scan("data_files//rt.txt", sep = "\t") # 20 item using tab sep

# to calculate the number of lines 20/5= 4

scan("data_files//rt.txt", sep = "\t") [1:4] # 138 NA NA NA
as.numeric( na.omit (scan("data_files//rt.txt", sep = "\t", quiet = T) [1:4])) # signifies the data as numeric, omits the
# na and remove th e'READ 20 FILES' use quiet = t


# but ultimately what we need is a list of vectors of variable lentghts 1, 2, 4, 2 and 1

sapply(1:5, function(i) # returns a vector same lenght as 'x' each element applied to fuction
              as.numeric(na.omit( # ... removes NA leaving only numbeical values ...
                scan("data_files//rt.txt", sep = "\t", quiet = TRUE) # ...from the rt.txt file range...
                [(4 * i - 3) : (4*i)] # ... 
              )))



