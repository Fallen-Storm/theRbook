# Chapter 2 Setup ------------------------------------------------
# For Windows

setwd("F://Projects//systemsbio//R//theRbook//")

# For MacbookPro

setwd("~//Documents//systemsbio/R/theRbook//")

# good practise to have all data file for a project in the same relative folder, that way the script can be used by
# anyone aslong as the files are in the same project folder


# Install --------------------------------------------------------------------------

install.packages(c("readxl", "rlang", "tibble"))
install.packages("tidyverse")

# Package Library ------------------------------------------------------------------

library("brew")
library("tidyverse")
tidyverse_update()

# Functions ------------------------------------------------------------------------

rt <- function(x) read.table( paste( "data_files//",x,".txt", sep = ""), header = T)
# read.table function in the format rt("file_name") to import .txt file as dataframe

SEM <- function(x) sqrt(var(x) / length(x))
# defines standard error of the mean

closest <- function(any_vec, spec_val){
  any_vec[which( abs(any_vec - spec_val) == min (abs(any_vec - spec_val)))]
} # returns the closet value to a specificed value (sv) in any vector(xv) 


run.and.value <- function(x) {
  a <- max( rle(poisson) [[1]])
  b <- rle(poisson) [[2]] [which( rle(poisson)[[1]] == a)]
  cat("length = ",a," value = ",b, "\n")
} # return the number of runs and their numerical value from a give vector



# 2.1 Calculations -------------------------------------------------
log(42/7.3)
# each line can have 8192 characters but can be split by an overhanging operator or
# another obviously incomplete synatx
5+6+3+6+4+2+4+8+3+2+7 
5+6+3+6+4+
  2+4+8+3+2+7 # = 50
5+6+3+6+4
  2+4+8+3+2+7 # = 24 and 26

# two or more expression can be placed on the same line but semicolon seperated
  ##GOOGLE Style guide recomends spaces around all primary operators
2 + 3; 5 * 7; 3 - 7
2e3 #2000
2e-2 #0.02
3.9+4.5i

# for rounding there are 2 options;
floor(5.7) #the greatest integer less than = 5
ceiling(5.7) # the next integer = 6

# easy to refine the floor function to go to the next integer by addin 0.5
  ## GOOGLE style guide -  spaces before open parenthesis but not in a fuction call
rounded <- function(x) floor(x + 0.5)
rounded(5.7) # = 6
rounded(5.4) # = 5

signif(12345678, 4) # shows sig fig of 4
signif(12345678, 5) # shows sig fig of 5
signif(12345678, 6) # shows sig fig of 6

119 / 13 # = 9.153
119 %/% 13 # = 9 (how many 13s in 119)
119 %% 13 # = 2 (what is left over known as'modulo')

# odd numbers have a modulo 2 number of 1, where as even has 0
9 %% 2 # = 1
8 %% 2 # = 0

15421 %% 7 == 0 # = TRUE (this will determine in 15421 is a multiple of 7)

x <- 5
x # (= 5)

x <- 5 # (= FALSE)

x <- c(5, 3, 7, 8)
is.integer(x) # = FALSE (returns TRUE or FALSE if agrument is of integer type or not) 
?is.integer()

is.numeric(x) # = TRUE (more generic test for an object being interpretable as numbers)
?is.numeric()

x <- as.integer(x)
is.integer(x) # (= TRUE)
x # = 5, 3, 7, 8

# 'integer' works as a 'trunc' when applied to real numbers and remove the imaginary 
# part when applied to complex numbers
as.integer(5.7) # = 5
as.integer(-5.7) # = -5
as.integer(5.7 -3i) # = 5 warning: imaginary parts discarded in coercion

gender <- factor( c("female", "male", "female", "male", "female"))
class(gender) # = "factor"
mode(gender) # = "numeric"
gender

data <- read.table("data_files/daphnia.txt", header = T)
attach(data) # database is attached to the R search path - fuctions and variables
             # within the database can be searched
head(data)
is.factor(Water) # = TRUE
levels(Detergent) # returns names of factors
nlevels(Detergent) # returns the numberof of levels of a factor
length (levels(Detergent)) # as above

as.vector (unclass(Daphnia)) # reclassifies Daphnia as a vector
View(data) # shows "data" within a tab not printed in console (CAPITAL V - View)

# 2.2 Logic operators -----------------------------------------------

TRUE == FALSE # = FALSE
T == F # = FALSE

T <- 0
T == FALSE # = TRUE

F <- 1
TRUE == F

T != F # = TRUE ("T" and "F" can be used as TRUE or FALSE; != not equal)
# Use TRUE and FALSE in full as T or F could be defined as variables

# catastrophic cancellation error - dramtic loss in acuracy when two similrly sized 
# big numbers are subtracted form each other eg...

x <- sqrt(2)
x * x == 2 # = FALSE

x * x - 2 # = 4.440892 e-16
# better instead to use "less than" with "greater than or equal to' or the converse
# due to this when you want to test for equality in floating point arthmatic 
# use the 'all.equal'

x <- 0.3 - 0.2
y <- 0.3 - 0.2
x == y # = true

x <- 0.3 - 0.2
y <- 0.1

x == y # = FALSE
identical(x, y) # = FALSE
all.equal(x, y) # = TRUE (allows for insignificant differences)
?all.equal

a <- c("cat", "dog", "goldfish")
b <- factor(a)
all.equal(a, b) #"all.equil - left object is 'target' and right is 'current'

class(b) # = factor
class(a) # = character

mode(b) # = numeric

attributes(b)
?character

n1 <- c(1, 2, 3)
n2 <- c(1, 2, 3, 4)
all.equal(n1, n2) # = numeric; lengths (3, 4) differ

n2 <- as.character(n2)
all.equal(n1, n2)
mode(n1)
class(n1)
attributes(n1)

x <- c(NA, FALSE, TRUE)
names(x) <- as.character(x)
attributes(x)
class(x)
mode(x)
?logical

outer(x, x, "&") # displays all the possibe T/F/NA combination for logical AND
outer(x, x, "|") #  displays all the possibe T/F/NA combination for logical OR
?outer

x <- 0:6
x < 4
all(x > 0)
any(x < 0)
sum(x < 4)
(x<4)*runif(7)
?runif

# reduces a 5-level factor (a - e) to a three level factor by compressing a and e
# (new factor level 1) and c and d (new level 3) whilst leaving b distinct

treatment <- letters[1:5]
t2 <- factor(1 + (treatment == "b") + 2 * (treatment == "c") 
             + 2 * (treatment == "d"))
treatment
t2

# 2.3 Generating Sequences ----------------------------------------

0:10
15:5

# for seq not in increments of 1 use "seq(FROM, TO, BY)"
seq(0, 1.5, 0.1) # seq accending from 0 to 1.5 in 0.1 increments
seq(6, 4, -0.2) # seq decending from 6 to 4 in 0.2 increments - third argument is
                # negative when the initail value is larger than the second


N <- c(55, 76, 92, 103, 84, 88, 121, 91, 65, 77, 99)
seq(from = 0.04, by = 0.01, length = 11) # requires knowlegdge of length of N
seq(from =  0.04, by = 0.01, along = N) # doesn't require N length
seq(from =  0.04, to = 0.14, along = N) # R will calculate increments

seq(1.4, 2.1, 0.3) # seq qill fal short if no exact, will not overstep

# if you wanta vector made up of differnt seq of different lenghts, use "sequence"
sequence( c(4, 3, 4, 4, 4, 5))
?sequence

rep(9, 5) # repeats first argument a number of times sepecified by the second
rep(1:4, 2) # = 12341234
rep(1:4, each = 2) # = 11223344
rep(1:4, each = 2, times = 3) # = 112233441122334411223344
rep(1:4, 1:4) # = 1223334444

# if we want a more compelx case where by there is a differnt but irregular repeat of
# for example four 1s, one 2, four 3s and two 4s. Use concat to create a vector of
# length 4 c(4, 1, 4, 2) which will act as the second argument in the rep function;
rep(1:4, c(4, 1, 4, 2))

x <- 1:4
x

attributes(x)
class(x)
mode(x)

rep( c("cat", "dog", "gerbil", "goldfish", "rat"), c(2, 3, 2, 1, 3))

gl(4, 3) # = generte levels in the form (upto), (with repeats of), (to total length)
gl(4, 3, 24) # total lenght of 24 in this instance repeats twice

temp <- gl(2, 2, 24, labels = c("Low", "High"))
soft <- gl(3, 8, 24, labels = c("Hard", "Medium", "Soft"))
M.user <- gl(2, 4, 24, labels = c("N", "Y"))
brand <- gl(2, 1, 24, labels = c("X", "M"))

data.frame(temp, soft, M.user, brand)



# 2.4 Membership: Testing and coercing in R ------------------------------------------------------

# Membership is the calss of object in R, coersion is changing that class

lv <- c(TRUE, FALSE, TRUE)
is.logical(lv)
levels(lv)
fv <- as.factor(lv)
is.factor(fv)
nv <- as.numeric(lv)
as.numeric( factor( c("a", "b", "c")))
as.numeric( c("a", "b", "c"))

# 2.5 misisng values, infinity and things that are not numbers ----------------------------------

y <- c(4, NA, 7)
y == NA # doesnt work
y == "NA" # doesnt work
is.na(y)
y[! is.na(y)] # This strips the missing value (NA) from the factor

y1 <- c(1, 2, 3, NA)
y2 <- c(5, 6, NA, 8)
y3 <- c(9, NA, 11, 12)
y4 <- c(NA, 14, 15, 16)

full.frame <- data.frame(y1, y2, y3, y4)

reduced.frame <- full.frame[! is.na(full.frame$y1),] # generates a new data frame excluding NA for y1

reduced.frame

x <- c(1:8, NA)
mean(x) # = 0 - to get the mean of NA values have to remove the NAs

mean(x, na.rm = T) # NA does not work in the
 
vmv <- c(1:6, NA, NA, 9:12)
vmv

seq(along = vmv) [is.na(vmv)] # index of missing values
which(is.na(vmv))

zero.vmv <- vmv
zero.vmv

zero.vmv[is.na(zero.vmv)] <- 0
zero.vmv

ifelse(is.na(zero.vmv), 0, zero.vmv) # same as above - ifelse(test, yes, no)

?ifelse

# 2.6 Vectors and subscripts ----------------------------------------

# vector is a variable with one or more values of the same type
peas <- c(4, 7, 6, 5, 6, 7)
class(peas) # = numeric
length(peas) # = 6
mean(peas)
max(peas)
min(peas)
quantile(peas)
peas <- scan()
peas

# subscripts invole using [ ] 
peas
peas[4]
pods <- c(2, 3, 6)
peas[pods] # this uses the value in pods as the subscript to interegate peas i.e vector position 2, 3 and 6
peas
peas[-1] # removes value 1
peas[-length(peas)] # removes the last value

trim <- function(x) sort(x) [-c(1, 2, length(x) -1, length(x))] # sorts the vector, then removes the smallest two
                                                                # values then the largest 2 values
trim(peas)

peas[1:3]
peas[seq (2, length(peas), 2)]
peas[1:length(peas) %% 2 == 0]

counts <- c(25, 12, 7, 4, 6, 2, 1, 0, 2)
names(counts) <- 0:8 # if bracketed wrong, counts becomes 0 : 8
counts

st <- table(rpois(2000, 2))
as.vector(st)

x <- 0:10
sum(x) # sum of the all the element in the vector = 55
sum(x < 5) # counts the cases that are greater than 5 = 5
# this is due ot coercion - allowing the TRUE to be coerced in to neumerical 1

sum(x [x < 5]) # finds the sum of all values less than 5 = 10 (0 + 1 + 2 + 3 + 4)

# how do we add the values of the three largest value in a vector?
y <- c(8, 3, 5, 7, 6, 6, 8, 9, 2, 3, 9, 4, 10, 4, 11)
sort(y)
rev(sort(y))
sum(rev(sort(y)) [1:3]) # = 30
# this method doesnt alter y in any way or make any intermediate vectors

x <- c(2, 3, 4, 1, 5, 8, 2, 3, 7, 5, 7) # vector indices for the postition 
which(x == max(x))
which(x ==  min(x))

which.max(x)
which.min(x)

# 2.7 Vector Functions ---------------------------------------------------
 
y <- c(8, 3, 5, 7, 6, 6, 8, 9, 2, 3, 9, 4, 10, 4, 11)
mean(y) # power of R is to evaulate fuctions over entire vectors

# a list of vector functions Table 2.4 page 41 (p63 pdf)

range(y)
fivenum(y) # Tukeys 5 number summery - min, lower hinge, median, upper hinge, max

counts <- rnbinom(10000, mu = 0.92, size = 1.1) # generation of 10K random integers from
                                                # negative binominal distribution

counts[1:30] # the question is; how may 0s, 1s, etc to the largest in the whole vector ?
table(counts)

data <- rt("taxa")
attach(data)
names(data)
tapply(Petals, Fruit, mean)
tapply(Petals, Fruit, var)
tapply(Petals, Fruit, min)
tapply(Petals, Sepal, function(x) sqrt(var(x) / length(x)))
SEM <- function(x) sqrt(var(x) / length(x))

tapply(Petals, Sepal, SEM)       

SEM(Petals)

# tapply can also be used to porduce a mulit-dimentional table by replacing one catagorical
# variable by a list pg categroical variable e.g
# tapply(temperature, list(yr, month), mean [ , 1:6]) both yr and month are names in
# temperature.txt file and [ , 1:6] restrict to 1st 6 months

# tapply will produce NA for fuctions with built-in protection against missing values
# the mean fuction will not return missing values;
# use tapply(temperature, yr, mean, na.rm = TRUE)

# to trim extreme values (outliers) use the 'trim option and specifiy the fraction of the 
# data you wish to omit (between 0 and 0.5) form the left and right tails;
# tapply(temperature, yr, mean, trim = 0.2)

agg_data <- rt("daphnia")
names(agg_data) # no pH data in data frame compared to example

# in the example below (modified) we have 2 continuous variable (Growth.rate and Daphnia)
# and 2 caregorical explanatory variables (Water and Detergent)


aggregate(Growth.rate ~ Water, agg_data, mean) # use of 1 to 1 aggrate
aggregate(Growth.rate ~ Water + Detergent, agg_data, mean) # use of 1 to many
aggregate(cbind (Growth.rate, Daphnia) ~ Water + Detergent, agg_data, mean) # many to many

# pmin and pmax functions take multiple vectors of the same lenght and calculates the 
# min or max of each and generates a new vector with those values

x <- c(1:5)
y <- c(4:8)
z <- c(3:7)

pmin(x, y, z) # = 1, 2, 3, 4, 5
pmax(x, y, z) # = 4, 5, 6, 7, 8


sum_data <- agg_data
  rm(agg_data)

names(sum_data)
tapply(sum_data$Growth.rate, sum_data$Detergent, mean) # without use of 'attach'
tapply(sum_data$Growth.rate, list(sum_data$Water, sum_data$Daphnia), median)


y <- c(8, 3, 5, 7, 6, 6, 8, 9, 2, 3, 9, 4, 10, 11)
which(y > 5) # which vaules in y are bigger than 5 as a list of subscripts
y[y > 5] # lists the values bigger than 5 in y

length(y) # =  14
length( y[y > 5]) # = 9

xv <- rnorm(1000, 100, 10) # 1000 random numbers with the mean 100 and SD of 10
which( abs(xv - 108) == min (abs(xv - 108))) # closest value ot 108 is in location 867
xv[867] # = 108.003

closest <- function(xvec, sval){
  xvec[which( abs(xvec - sval) == min (abs(xvec - sval)))]
}
# returns the closet value to a specificed value (sv) in any vector(xv)
closest(xv, 108)

houses <- read.table("data_files//houses.txt", header = TRUE)
names(houses)        

ranks <- rank(houses$Price)
sorted <- sort(houses$Price)
ordered <- order(houses$Price)

view <- data.frame(houses$Price, ranks, sorted, ordered)
view

file.edit("data_files//houses.txt")
houses$Location[order(houses$Price)]
houses$Location[rev( order(houses$Price))]

search()
detach()

(poisson <- rpois(150, 0.7))
rle(poisson) # run length encoding asks how may of on number is duplicated untill the next
max( rle(poisson) [[1]]) # finds the longest run on numbers = 6
which( rle(poisson) [[1]] == 6)
rle (poisson) [[2]] [c(58, 50)]

run.and.value <- function(x) {
  a <- max( rle(poisson) [[1]])
  b <- rle(poisson) [[2]] [which( rle(poisson)[[1]] == a)]
  cat("length = ",a," value = ",b, "\n")
} # return the number of runs and their numerical value from a give vector fun = 'x'
run.and.value(poisson)

setA <- c("a", "b", "c", "d", "e")
setB <- c("d", "e", "f", "g")

union(setA, setB) # add the two together but only unique
intersect(setA, setB) # shows the material they have in common

setdiff(setA, setB) # = a, b, c
setdiff(setB, setA) # = f , g

setA %in% setB # = F F F T T
setB %in% setA # = T T F F




# 2.8 Matrices and arrays -------------------------------------------------------------

y <- 1:24
dim(y) <- c(2,3,4) # gneration of a 3D array of 1 to 24 2 x 4 x 3
y
dim(y) <- c(3, 2, 4)
y

# a matris is a 2D array on numbers. In a sbscript [5, 3] the first number refers to the
# row (rows are defined as margin number 1) and the second as the coloumn (2nd margin)
# thefore [ , 4] means all the rows in coloumn 4 of an object
# and [2, ] means all the coloumns in row 2

x <- matrix( c(1, 0, 0, 0, 1, 0, 0, 0, 1), nrow = 3) # by default the num entered by coloumn
x
class(x) # = matrix
attributes(x) # = dim 3 3

vector <- c(1, 2, 3, 4, 4, 3, 2, 1)
V <- matrix(vector, byrow = TRUE, nrow = 2) # data enters row-wise not by column
V

# if using the dim FUN;

dim(vector) <- c(4, 2)
is.matrix(vector)
vector 
vector <- t(vector) # need to transpose to get data entered per row
vector

x <- matrix( rpois(20, 1.5), nrow = 4)
x

rownames(x) <- rownames(x, do.NULL = FALSE, prefix = "Trial.")
x

drug.names <- c("arpirin", "paracetamol", "nurofen", "hedex", "placebo")
colnames(x) <- drug.names
x

# you can use dimnames to give names to all the rows and/or columns
#  the argument of dimnames has to be a lsit (ros first, columns second)
# with the elements being exactly the correct length

dimnames(x) <- list (NULL, paste0("drug.", 1:5, sep = ""))
x

help("paste0")

mean(x[ , 5])
var(x[4, ])
rowSums(x)
colSums(x)
rowMeans(x)
colMeans(x)
apply(x, 2, mean)
help("apply")

# to only sum/mean grups of columns/rows use rowsum (No Caps)

group <- c("A", "B", "B", "A") # groups rows 1+4 and 2+3 in to A dn B respecrively
rowsum(x, group)

tapply(x, list(group[row(x)], col(x)), sum)
aggregate(x, list(group), sum)

apply(x, 2, sample) # shuffles the samples in a matrix
# in apply, the second element denotes the margin (1 for row, 2 for column)

# we have been aske to add a row at the bottom shoing column means
# and a column to the right showinf row variances

x <- rbind(x, apply(x, 2, mean))
x <- cbind(x, apply(x, 1, var))
x

View(x)

colnames(x) <- c(1:5, "Variance")
rownames(x) <- c(1:4, "Mean")
View(x)

rowmatrix <- mat[2, , drop = FALSE]

# the *sweep* function used to 'sweepout' summaris fo vectors/matrices/arrays/dataframes

matdata <- read.table(file.choose())

cols <- apply(matdata, 2, mean)
cols
sweep(matdata, 2, cols)

# you can replicate sweep by doing to long hand calcs

col.mean <- matrix(rep(cols, rep(10, 4)), nrow = 10)
col.mean

matdata - col.mean

(x <- matrix(1:24, nrow = 4)) # placing total in parenthesise causes the values to be printed

apply(x, 1, sum)
apply(x, 2, sum)
apply(x, 1, sqrt) # apply to individual vaules
apply(x, 2, sqrt) # margin only dictaes the shape of the data

apply(x, 1, sample)

# you can supply your own function definition also
apply(x, 1, function(y) y^ 2+y) # NB 'y' does not matter just consistent

# to apply a function across a vector use sapply
sapply (3:7, seq) # generates group of seqs from 1:3 to 1:7

# the following contain data of deay of radioactive emission over a 50-day period
# we will ise non-linear least square to estimate the decay rate 'a' in 'y = exp(-ax)'
sapdecay <- read.table("./data_files/sapdecay.txt", header = TRUE)
View(sapdecay)
names(sapdecay)
attach(sapdecay)
# the R book here uses attach - this should never be used, and is expained later

# we need to write a function that sums the squares fot he dofferences observed (y)
# and predicted (yf) values fo y, when provided with a specific value of the parameter a

sumsq <- function(a, xv = x, yv = y){
          yf <- exp(-a*xv)
          sum((yv-yf)^2)
        }

lm(log(y)~ x)
a <- seq(0.01, 0.2, .005)
a
plot(a, sapply(a, sumsq), type = 'l')
a[min( sapply(a, sumsq)) == sapply(a, sumsq)]

plot(x, y)
xv <- seq(0, 50, 0.1)
lines(xv, exp(-0.055*xv))

# tihs can be streamlines witht he optimise fuction

fa <- function(a){
        sum((y - exp(-a*x)) ^2)  
      }
optimise(fa, c(0.01, 0.1))

fb <- function(a){
      sum( abs(y - exp(-a*x)))
      }
optimise(fb, c(0.01, 0.1))


# we are tasked to calculate the number of plots a species is dominant in the Park Gras dataframe
# this invloes scanning each row of a matrix and reporting the coloum number that contain the max

data <- read.table("./data_files/pgfull.txt", header = TRUE)
attach(data)
names(data)
View(data)

# species names are reperesent by a 2-letter code. We define the dominent species as the one with
# largest biomass in a plot. 

# 1. create a data.frame containing only species abundances
# NB the first 54 colomns contain species abundance

species <- data[,1:54]
max.col(species) # scan all rows, and returns the col number that returns the max biomass

# we can use what max.col(species) returns as the index for (names)
(names(species)[max.col(species)]) 
dom.species <- table(names(species)[max.col(species)]) # total number of plots species are dominant
length(dom.species) # total number of species dominant on one or more plot

length(names(species)) - length(dom.species) # number of species in the system that never acheive dominance

# reordering a multidimemtioanl array using aperm

# we have data in an array with 3 dimentions - 2 sexes, 3 ages and 4 income groups
# for ease these will be represent by the number 1 - 24
data <- array(1:24, 2:4)
View(data)

data.2 <- array(1:24, 2:4)
data.2
help(array)
# this generates 4 sub-tables, each with 3 columns and 2 rows

dimnames(data)[[1]] <- list("male", "female")
dimnames(data)[[2]] <- list("young", "mid", "old")
dimnames(data)[[3]] <- list("A", "B", "C", "D")

data

# what if you now want the four income groupd to be the columrs, with the subtables the gender

new.data <- aperm(data, c(2, 3, 1)) # order = row, column, subtable
new.data

help(lm)
help(table)


# 2.9 Random numbers, sampling and shuffling --------------









