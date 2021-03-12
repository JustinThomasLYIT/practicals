# First step
# Assign number 2 variable x
x <- 2
# same as x = 2
y <- 5
y
rm(y)
y
class(x)
# test to see if x is numeric.  rm is remove
is.numeric(x)
a <- 4
class(a)
a <- 4L
class(a)
b <- 2.8
class(b)
c <- a * b
class(c)

x <- "data"
x
class(x)
y <- factor("data")
y
nchar(x)

date1 <- as.Date("2021-11-03")
date1
class(date1)
as.numeric(date1)

