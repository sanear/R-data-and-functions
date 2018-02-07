## Script for first eCollege R brown bag ##

## DATATYPES ##
## The basics: numeric, character, logical, factor
num <- 1
num
nums <- c(1,2,3)
nums
class(num)
class(nums)

chr <- "1"
chr
as.numeric(chr)
chrs <- c(1, 2, 3, "a", "b", "c")
chrs
class(chr)
class(chrs)

logicals <- c(T, F, F, T)
logicals
class(logicals)

## Factors - very confusing at first.
x <- factor(c("a", "b", "c", "d", "a"))
x
as.character(x)
as.numeric(x)
levels(x)

## Data structures: vectors, matrices, arrays, lists, and data.frames
## Vectors
x <- 1:9
x
x <- seq(from = 1, to = 9, by = 1)
x
x <- runif(9, min = 0, max = 1)
x

## Matrices (which are vectors)
A <- matrix(x, nrow = 3, ncol = 3)
A
class(A)

## Arrays are matrices with more than 2 dimensions
B <- array(x, c(3,3,3,3))
B
class(B)

## Lists
list <- list(x)
list
class(list)
list <- list(Numbers = x, Reciprocals = 1/x)
list
list$Numbers * list$Reciprocals

## Data frames (which are lists)
df <- data.frame(Col1 = x, Col2 = 1/x, Col3 = rnorm(length(x)), Col4 = mean(x))
df
class(df)
as.list(df)

## Referencing members of these data structures
## Vectors
x <- sample(1:100, 10)
x
x[1]
x[3:5]
x[c(2,4)]
x[-7]

## Matrices
mat <- matrix(x, nrow = 3, ncol = 3)          # Warning
mat <- matrix(x[-1], nrow = 3, ncol = 3)
mat
mat[1,2]
mat[7]          # NA

## Lists
list <- list(Numbers = x, Reciprocals = 1/x, f = function(x) {
  print(x * x)
})
list
list$Numbers
list[[1]]
list[["Reciprocals"]]
class(list[[1]])

list[1]
class(list[1])

## Data frames
df <- data.frame(Col1 = x, Col2 = 1/x, Col3 = rnorm(length(x)), Col4 = mean(x))
df
df$Col1
df[[1]]
df[["Col1"]]
class(df[[1]])

df[3, 3]
df[, 3]
df[3, ]

df[1]
class(df[1])

## FUNCTIONS ## 
## Information about objects - try these on your own
print(df)

length(df)
length(df$Col1)

class(df)

names(df)
names(list)
names(x)

str(df)

## Modify and combine objects
df2 <- data.frame(ID = 12345:12354, Value = rnorm(10))
df2
c(df$Col1, df2$Value)
cbind(df$Col1, df2$Value)
cbind(df, df2$Value)
rbind(df, df[1, ])
df$ID <- df2$ID
df
df <- df[, c(5, 1, 2, 3, 4)]
df
merge(df, df2)

## Objects in memory
ls()
rm(df2)
ls()

## Loops vs. apply() functions
## Looping works like python
x <- sample(1:10, 10)
x

y1 <- NULL
for (i in x)
  if (i < 5) {
    y1 <- c(y1, 0)
  } else
    y1 <- c(y1, 1)
y1

y2 <- vector(length = length(x))
for (i in 1:length(x)) {
  if (x[i] < 5)
    y2[i] <- 0
  else
    y2[i] <- 1
}
y2
y1 == y2

## But it is very slow - better to use apply() functions
## and let C do the looping work.
myFunc <- function(x, CONST = 5) {
  if (x < CONST) 
    return(0)
  else
    return(1)
}

y3 <- sapply(x, function(x, CONST = 5) {
  if (x < CONST) 
    return(0)
  else
    return(1)
  })
y3
y1 == y3

## The CONST = 5 part is a default argument. By entering
## nothing in that slot, I implicity choose the default value.
y4 <- sapply(x, function(var) myFunc(var, 8))
y4
y1 == y4

## There are many other apply functions -
## type ?sapply or ?apply to learn about some others

## OBJECT-ORIENTATION ##
## OO is very limited in S3: objects are lists, class is an attribute
myObj <- list(vector = x, matrix = mat, list = list, data.frame = df)
myObj
class(myObj)
class(myObj) <- "myClass"
class(myObj)

## Want a subclass? Just append
class(myObj) <- c("mySubclass", class(myObj))
class(myObj)

## I often implement a guard at the top of a function whose arguments
## must be of a certain class
myOtherFunc <- function(x) {
  if (!is.element("mySubclass", class(x))) {
    print("I'm expecting an object of class mySubclass.")
    return()
  }
  print(x)
}

myOtherFunc(myObj)
myOtherFunc(x)

## You can also define multiple versions of the same function based on
## the class of the first argument by using functionName.class, but
## I am probably out of time. Good luck!
