# Install necessary packages
install.packages(c("readr", "psych"))

# Load libraries
library(readr)    # For efficient data reading
library(psych)    # For descriptive statistics

# Load your dataset
# Make sure the CSV file is in your working directory or give full path
my_data <- read.csv("C:\\Users\\info\\Downloads\\house_prices_Texas_counties.csv")

# View the first few rows
head(my_data)

# View the last few rows
tail(my_data)

# Get the dimensions (rows and columns)
dim(my_data)

# Print the dimensions clearly
cat("Dimensions (Rows, Columns): ", dim(my_data), "\n")

# Get the structure (variable types and number of observations)
str(my_data)

# See a summary of the dataset
summary(my_data)

# Get the column names
names(my_data)
cat("Column Names: ", names(my_data), "\n")

# Use the 'psych' package for more detailed descriptive statistics
# 'describe()' provides: n, mean, sd, median, trimmed mean, mad, min, max, range, skew, kurtosis, and se.
summary(my_data)
