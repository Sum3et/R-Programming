# Load required libraries
library(readr)
library(dplyr)

# Read the dataset
marks_data <- read_csv("C:\\Users\\Rohit\\OneDrive\\Documents\\Datasets\\College_Marks_Dataset.csv")

# View structure of the dataset
str(marks_data)

# Select only numeric columns
numeric_marks <- marks_data %>%
  select(where(is.numeric))

# Generate correlation matrix
cor_matrix <- cor(numeric_marks, use = "complete.obs")

# Display correlation matrix
cor_matrix

# Display rounded correlation matrix (exam-friendly)
round(cor_matrix, 2)
