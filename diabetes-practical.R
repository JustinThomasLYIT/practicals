# read in the diabetes file
diabetes_data <- read.csv("Diabetes-md.csv", na = "")

# what type is the data?
str(diabetes_data)
class(diabetes_data)
dim(diabetes_data)

# exmine missing data
library(mice)
md.pattern(diabetes_data)

missing_data <- diabetes_data[!complete.cases(diabetes_data),]

library(VIM)
missing_data2 <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)

# show content of missing values
summary(missing_data2)
