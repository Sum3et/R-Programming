library(dplyr)

# 1. Load Dataset
df <- read.csv("C:\\Users\\Rohit\\Downloads\\salary.csv")
print("Dataset Loaded Successfully")

# 2. Dataset Overview
head(df)
str(df)
summary(df)

# 3. Select Required Columns and Clean Data
df <- df %>%
  select(Department, Salary) %>%
  na.omit() %>%
  filter(Department != "HR")

print("Cleaned Dataset Ready")

# 4. Check Group Sizes
table(df$Department)

# 5. Hypothesis
# H0: Mean salary of all departments is equal
# H1: At least one department has a different mean salary

# 6. Perform One-Way ANOVA
anova_result <- aov(Salary ~ Department, data = df)

print("One-Way ANOVA Result:")
summary(anova_result)

# 7. Decision Based on p-value
p_value <- summary(anova_result)[[1]][["Pr(>F)"]][1]

if (p_value < 0.05) {
  print("Reject the null hypothesis")
  print("There is a significant difference in salaries across departments")
} else {
  print("Fail to reject the null hypothesis")
  print("No significant salary difference across departments")
}

