# Introduction -------------------------------------------------------
# This is an annoataion
setwd("~/Documents/systemsbio/R/theRbook/data_files")
# Folder that contains sample data .txt files 

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

