# Enter data into vectors before constructing the dataframe

date_col <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32,45,25,39,99)
q1_col <- c(5,3,3,3,2)
q2_col <- c(4,5,5,3,2)
q3_col <- c(5,2,5,4,1)
q4_col <- c(5,5,5,NA,2)   # NA is inserted in place of the missing data
q5_col <- c(5,5,2,NA,1)

#construct a dataframe from all the vectors
managers_data <- data.frame(date_col,country_col,gender_col, 
                            age_col, q1_col, q2_col, q3_col, q4_col, q5_col)
managers_data

column_names <- c("Date", "Country", "Gender", "Age", 
                  "Q1", "Q2", "Q3", "Q4", "Q5")

#Add column names to the managers data_data dataframe

colnames(managers_data) <- column_names

managers_data

# recode the incorrect age to NA
managers_data$Age[managers_data$Age == 99] <- NA

managers_data

managers_data$q4[managers_data$q4 == " "] <- NA

# 2 options to create a new variable
#1 - create a new vector and store the logical check in it
#2 - create the new variable when doing the logical check

managers_data$age_cat[managers_data$Age < 26] <- 'Young'
managers_data$age_cat[managers_data$Age >= 26 & managers_data$Age <= 44] <- 'Middle Aged'
managers_data$age_cat[managers_data$Age >= 45] <- 'Elder'
managers_data$age_cat[is.na(managers_data$Age)] <- 'Elder'

#recode age_cat so that is is ordinal and factored
# with the order young, middle aged and elder

age_cat <- factor(managers_data$age_cat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

age_cat

#replace manager data age_cat variable with the factored variable

managers_data$age_cat <- age_cat

managers_data

#look at the structure of the dataframe

str(managers_data)
