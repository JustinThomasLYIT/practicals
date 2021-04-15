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

# dealing with missing data
# i've decided to keep only data with # missing type and health status
# an dthe address are not important
keep_this_data <- diabetes_data[!complete.cases(diabetes_data$Daibetes.type, diabetes_data$Status),]
keep_this_data
dim(keep_this_data)
# 15 rows with missing data that i would like to keep
# reverse the logic to csontain relevant data
keep_this_data <- diabetes_data[complete.cases(diabetes_data$Daibetes.type, diabetes_data$Status),]
keep_this_data
dim(keep_this_data)
dim(diabetes_data)

# replace the original datafram with the content of the processed data
diabetes_data <- keep_this_data
head(diabetes_data, 15)


# 4 configure type to an unordered factor with 2 levels
diabetes_data$Type <- factor(diabetes_data$Type, order = FALSE, levels = c("Type 1", "Type 2"))

# refactor status too
diabetes_data$`Health status` <- factor(diabetes_data$`Health status`, order = TRUE, levels = c("Poor", "Improved", "Excellent"))
col_names <- c("Patient Name", "NI address", "Type", "Age", "Health status")
colnames(diabetes_data) <- col_names

str(diabetes_data)


# lets look  at the class of each element in the data frame
class_list <- lapply(diabetes_data, class)
class_list

class_list <- sapply(diabetes_data, class)
class_list



# build the data frame first
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,45)

# creat a new data frame
drugs <- data.frame(dose,drugA, drugB)
drugs
str(drugs)


#general plot of data
plot(drugs)

attach(drugs)
plot(dose, type="o", col = "blue")
?plot

# option type = b shows both lines should be plotted
plot(dose, drugA, type = "b")


# par - customise any setting such as fonts, colours, etc
# pars = parameters
# store the default content of par before we make any changes to them

opar <- par(no.readonly = TRUE)

# lty = line type
# lwd = line width
# lty = 2dashed line
# pch = 17 solid triange

par(lty = 2, pch = 17)
plot(dose, drugA, type = "b")

par = opar

plot(dose, drugA, type = "b", lty = 2, pch = 17)

graph_range <- range(0, drugA, drugB)
graph_range
plot(drugA, type = "o", col = "blue", ylim = graph_range, axes = FALSE, ann = FALSE)
