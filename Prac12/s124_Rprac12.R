library(dplyr)
library(tidyr)

house_df <- read.csv("C:\\Users\\info\\Downloads\\house_prices_Texas_counties.csv")
student_df <- read.csv("C:\\Users\\info\\Downloads\\Student_Marks - Student_Marks.csv")

print("--- Column Names Before Cleaning ---")
print(names(house_df))
print(names(student_df))

house_clean <- house_df[, c(1, 2)]   # select FIRST TWO columns
names(house_clean) <- c("ID", "Value")

student_clean <- student_df[, c(1, 2)]
names(student_clean) <- c("ID", "Value")

# Convert both to correct types
house_clean$Value   <- as.numeric(house_clean$Value)
student_clean$Value <- as.numeric(student_clean$Value)

combined_data <- rbind(house_clean, student_clean)

print("--- Combined Data Summary ---")
print(paste("House rows:", nrow(house_clean)))
print(paste("Student rows:", nrow(student_clean)))
print(paste("Total Expected:", nrow(house_clean) + nrow(student_clean)))
print(paste("Total Actual:", nrow(combined_data)))

print("--- Preview of Combined Data (Top and Bottom) ---")
print(head(combined_data))
print(tail(combined_data))
