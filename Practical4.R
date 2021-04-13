# read in moredata csv downloaded from blackboard
new_managers_data <- read.csv("MoreData.csv", na = "")

# show structure
str(new_managers_data)

# SHow the headers from both data frames
names(managers_data)
names(new_managers_data)

include_list <- new_managers_data[c("Date",
                                    "Country",
                                    "Gender",
                                    "Age",
                                    "Q1",
                                    "Q2", "Q3", "Q4", "Q5")]

include_list

#this is how we will combine the data frames
# but right now it doesnt work

rbind(managers_data, include_list)

# creat a new "AgeCat" cariable in include list
# and then calculate  containing values
attach(include_list)
include_list$AgeCat[Age >= 45] <- "Elder"
include_list$AgeCat[Age >= 26 & Age <= 44] <- "Middle Aged"
include_list$AgeCat[Age <= 25] <- "Young"

#If NA is found then categorise as 'Elder'
include_list$AgeCat[is.na(Age)] <- "Elder"
detach(include_list)

include_list

rbind(managers_data, include_list)

managers_data <- managers_data[2:11]

managers_data

#update the date field on both frames so that they are in the correct format
# combine both data frames

str(include_list)
str(managers_data)
include_list$Date <- as.Date(include_list$Date,"%m/%d/%Y")

modified_managers <- rbind(managers_data, include_list)

modified_managers

# Set AgeCat with ordered factor
# so that the young < middle ages < elder

modified_managers$AgeCat <- factor(modified_managers$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

str(modified_managers)
