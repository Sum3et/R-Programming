library(dplyr)

# 1. Load Dataset
df <- read.csv("C:\\Users\\IT\\Downloads\\games.csv")
print("Dataset Loaded Successfully")

# 2. Dataset Overview
head(df)
str(df)
dim(df)

# 3. Create Paired Variables
set.seed(123)   # for reproducibility

df$Rating_Before <- df$Rating
df$Rating_After  <- df$Rating + runif(nrow(df), -0.2, 0.2)

print("Summary of Rating Before:")
summary(df$Rating_Before)

print("Summary of Rating After:")
summary(df$Rating_After)

# 4. Prepare Paired Data
paired_df <- df %>%
  select(Rating_Before, Rating_After) %>%
  na.omit()

print("Number of paired observations:")
nrow(paired_df)

# 5. Descriptive Statistics
mean_before <- mean(paired_df$Rating_Before)
mean_after  <- mean(paired_df$Rating_After)

print(paste("Mean Rating Before:", round(mean_before, 2)))
print(paste("Mean Rating After:", round(mean_after, 2)))

# 6. Paired t-test
# H0: Mean difference between ratings is zero
# H1: Mean difference between ratings is not zero

print("Paired t-test Result:")

t_test_result <- t.test(
  paired_df$Rating_Before,
  paired_df$Rating_After,
  paired = TRUE
)

print(t_test_result)

# 7. Decision Based on p-value
if (t_test_result$p.value < 0.05) {
  print("Reject the null hypothesis")
} else {
  print("Fail to reject the null hypothesis")
}
