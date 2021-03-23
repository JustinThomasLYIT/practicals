
# file downloaded from blackboard and inserted into data frame
# Missing content replaced with NA
managers_data <-  read.csv("managers.csv", na = "")

# view the structure of the data frame
str(managers_data)

# convert date to a date variable
# it is currently in mm/dd/yy

converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date
str(converted_date)

# replace the date field in the data frame
managers_data$Date <- converted_date
str(managers_data)

# convert age variable to int
managers_data$Age <- as.integer(managers_data$Age)
str(managers_data)


# select records within 15-10-18 and 01-11-18
start_date <-  as.Date("2018-10-15")
end_date  <-   as.Date("2018-11-01")
new_date <- managers_data[
  managers_data$Date >= start_date & 
    managers_data$Date <= end_date,]
new_date

names(managers_data)
# drop attribute (var) from data
# shows where specific var names are
include_list <- names(managers_data) %in% c("Q3", "Q4")
include_list

# This data frame only contains q3 and q4
new_managers <- managers_data[(include_list)]
new_managers
str(new_managers)

# using the subset function
# to extract all records where age > 35 or age < 24
# only select q1 - q4

attach(managers_data)
new_data <- subset(managers_data, Age > 35 | Age < 24,
                   select = c(Q1, Q2, Q3, Q4))
new_data

# select a subset of managers_data
# where gender = m and age >25. Only show records
# from gener to q4 inclusive
attach(managers_data)
gender_data <- subset(managers_data, Gender == "M" & Age > 25,
                   select = c(Gender, Age, Q1, Q2, Q3, Q4))
gender_data


