# read in dataset

data_brexit <- read.csv("data_brexit_referendum.csv", na="")

str(data_brexit)
class(data_brexit)
head(data_brexit)

# count the -1s in NA

length(data_brexit$Leave[data_brexit$Leave == -1])

data_brexit$Leave[data_brexit$Leave == -1] <- NA

#Q4
na_records <- data_brexit[!complete.cases(data_brexit),]
length(na_records)

#visualise the patterns
library(mice)
md.pattern(data_brexit)

library(VIM)
missing_data3 <- aggr(data_brexit, prop = FALSE, numbers = TRUE)
summary(missing_data3)


# proportion of voters who want to leave. New variable

data_brexit$Proportion <- data_brexit$Leave/data_brexit$NVotes
head(data_brexit)
summary(data_brexit$Proportion)

# if propoertion < 0.5 then remain else leave

data_brexit$Vote[data_brexit$Proportion <= 0.5] <- "Remain"
data_brexit$Vote[data_brexit$Proportion > 0.5] <- "Leave"

str(data_brexit)

# Var is a charagcter to no need to convert first

attach(data_brexit)
data_brexit$RegionName[RegionName == 'London'] <- 'L'

data_brexit$RegionName[RegionName == 'North West'] <- 'NW'
data_brexit$RegionName[RegionName == 'North East'] <- 'NE'
data_brexit$RegionName[RegionName == 'South West'] <- 'SW'
data_brexit$RegionName[RegionName == 'South East'] <- 'SE'
data_brexit$RegionName[RegionName == 'East Midlands'] <- 'EM'
data_brexit$RegionName[RegionName == 'West Midlands'] <- 'WM'
data_brexit$RegionName[RegionName == 'East of England'] <- 'EE'
data_brexit$RegionName[RegionName == 'Yorkshire and the Humber'] <- 'Y'

summary(data_brexit)


# use sapploy to fucntion to examine the structure of each variable

numeric_variable_list <- sapply(data_brexit, is.numeric)
class(numeric_variable_list)
numeric_variable_list

# use this logic to create a subset of the data
numeric_data <- data_brexit[numeric_variable_list]
head(numeric_data)

#remove the ID field as it is no benefit

numeric_variable_list["ID"] <- FALSE

numeric_data <- data_brexit[numeric_variable_list]
head(numeric_data)


# we can use apply() function to return a list
# where each list member has a corresponding name
lapply(numeric_data, summary)
