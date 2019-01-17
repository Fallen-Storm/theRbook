# Chapter 3 Setup and Functions ------------------------------------------------

  # For Windows

setwd("F://Projects//systemsbio//R//theRbook//")

  # For MacbookPro

setwd("~//Documents//systemsbio/R/theRbook//")

# good practise to have all data file for a project in the same relative folder, that way the script can be used by
# anyone aslong as the files are in the same project folder


rt <- function(x) read.table( paste( "data_files//",x,".txt", sep = ""), header = T)
# read.table function in the format rt("file_name") to import .txt file as dataframe


# 3.1 Data input for the keyboard ------------------------------------

x <- scan() # input individual numbers in to vector in console
# you can alos paste dictectly into the input

# 3.2 Data input for files -------------------------------------------

dir("F://")

data <- read.table( file.choose(), header = TRUE)
head(data)

data <- read.table('yield.txt', header = TRUE)
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

# scan will work better with untidy dataframe such as this - but you will wish to skip the header row as this contains
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
View(data_files//rt.txt)

scan("data_files//rt.txt", sep = "\t") [1:4] # 138 NA NA NA
as.numeric( na.omit ( scan("data_files//rt.txt", sep = "\t", quiet = T) [1:4])) # signifies the data as numeric, omits the
# na and remove th e'READ 20 FILES' use quiet = t


# but ultimately what we need is a list of vectors of variable lenghts 1, 2, 4, 2 and 1

sapply(1:5, function(i) # returns a vector same lenght as 'x' each element applied to fuction
              as.numeric(na.omit( # ... removes NA leaving only numbeical values ...
                scan("data_files//rt.txt", sep = "\t", quiet = TRUE) # ...from the rt.txt file range...
                [(4 * i - 3) : (4*i)] # ... 
              )))

# 3.4 Reading data from a file using readLines ------------------------------------

lines <- readLines("data_files//worms.txt")
lines # each line has become a single character string - must strip out \t

db <- strsplit(lines,"\t") # removes tabs and seperates onto new lines
db

bb <- unlist(db)
bb
data.class('bb') # charcter class
str(bb)

dim(bb) <- c(7,21) # 'dim' shows diminetions to object
t(bb) [-1, ] # transpose vector and drop 1st row as this contains header

bb_frame <- as.data.frame(t (bb)[-1, ]) # bb becomes data frame -header
head(bb_frame)
names(bb_frame) <- t(bb)[1, ] # gets headers names from transposed line 1 of bb
head(bb_frame)

readLines("data_files//rt.txt")
strsplit(readLines("data_files//rt.txt"), "\t")
rows <- lapply( 
  strsplit( 
    readLines("data_files//rt.txt"), "\t"), as.numeric)
rows

sapply( 1:5, function(i) as.numeric( na.omit (rows[[i]])))

# 3.5 Warnings when you attach a dataframe --------------------------------

help(attach)

murder <- read.table("data_files//murders.txt", header = TRUE, as.is = 'region')
murder <- rt("murders")
head(murder)

attach(murder) # object is masked by .GlobalEnv

# attach function makes the variables in th etable accessable/ searchable by name

murders <- murder
rm(murder)
attach(murders)
table(region) # if dataframe not attached murder¢region
detach()
table(region)




