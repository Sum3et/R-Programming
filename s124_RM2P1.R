library(dplyr)
library(psych)


df <- read.csv("C:\\Users\\IT\\Downloads\\Sample - Superstore.csv")

print("Dataset Loaded Successfully")

# 2. Basic Exploration
str(df)
head(df)
dim(df)

# 3. Identifying Numeric Variables
numeric_data <- df %>% select_if(is.numeric)

print("Numeric Variables:")
names(numeric_data)

# 4. Missing Value Analysis
print("Missing values in each column:")
colSums(is.na(df))

# 5. Descriptive Statistics using summary()
print("Summary Statistics:")
summary(numeric_data)

# 6. Detailed Descriptive Statistics using describe()
print("Detailed Descriptive Statistics:")
describe(numeric_data)

# 7. Measures of Dispersion
print("Standard Deviation of Sales:")
sd(df$Sales)

print("Variance of Sales:")
var(df$Sales)

# 8. Group-wise Descriptive Statistics
print("Average Sales and Profit by Region:")

df %>%
  group_by(Region) %>%
  summarise(
    Avg_Sales = mean(Sales, na.rm = TRUE),
    Avg_Profit = mean(Profit, na.rm = TRUE),
    Total_Orders = n()
  )
