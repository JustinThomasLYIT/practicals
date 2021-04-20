# read the diabetes csv
diabetes_data <- read.csv("diabetes.csv", na = "")

# delete missing values
na.omit(diabetes_data)

diabetes_data

# create new date variable
diabetes_data$Date <- paste("1",diabetes_data$Month, diabetes_data$Year, sep="/")

diabetes_data

str(diabetes_data)

#change the date variable to a date. needs day month and year

datetemp <- as.Date(diabetes_data$Date, "%d/%m/%Y")

str(datetemp)

diabetes_data$Date <- datetemp


# plot the status variable using the plot function
diabetes_data$Status <- factor(diabetes_data$Status, order = TRUE, levels = c("Poor", "Improved", "Excellent") )

str(diabetes_data)

plot(diabetes_data$Status, main="Diabetes Status Chart", xlab = "Status", ylab = "Count")
summary(diabetes_data$Status)

# save the modified diabetes data frame
write.csv(diabetes_data, file = "diabetes-data-modified.csv")

