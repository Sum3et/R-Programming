library(dplyr)

# 1. Load Dataset
df <- read.csv("C:\\Users\\IT\\Downloads\\Cars Datasets 2025.csv")
print("Dataset Loaded Successfully")

# 2. Dataset Overview
head(df)
str(df)
dim(df)

# 3. Data Cleaning: Convert Car Prices to Numeric
# H0: Mean car price = 500000
# H1: Mean car price ≠ 500000

df$Clean_Price <- gsub("\\$|,", "", df$Cars.Prices)

# If price is a range (e.g. 12000-15000), take the average
df$Clean_Price <- sapply(df$Clean_Price, function(x) {
  if (grepl("-", x)) {
    mean(as.numeric(strsplit(x, "-")[[1]]))
  } else {
    as.numeric(x)
  }
})

print("Summary of Cleaned Car Prices:")
summary(df$Clean_Price)

# 4. Descriptive Statistics
mean_price <- mean(df$Clean_Price, na.rm = TRUE)
sd_price <- sd(df$Clean_Price, na.rm = TRUE)

print(paste("Mean Car Price:", round(mean_price, 2)))
print(paste("Standard Deviation:", round(sd_price, 2)))

# 5. One-Sample t-test
print("One-Sample t-test Result:")

t_test_result <- t.test(df$Clean_Price, mu = 500000)
print(t_test_result)

# 6. Decision Based on p-value
if (t_test_result$p.value < 0.05) {
  print("Reject the null hypothesis")
} else {
  print("Fail to reject the null hypothesis")
}

