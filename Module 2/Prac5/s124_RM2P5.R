library(dplyr)

# 1. Load Dataset
df <- read.csv("C:\\Users\\IT\\Downloads\\pizza_sales.csv")
print("Dataset Loaded Successfully")

# 2. Dataset Overview
head(df)
str(df)
dim(df)

# 3. Create Grouping Variable (IMPORTANT)
df$size_group <- ifelse(
  df$pizza_size %in% c("S", "M"),
  "Small/Medium",
  "Large/XL"
)
print("Group Distribution:")
table(df$size_group)


# 4. Summary Statistics by Group
# Using unit_price as numeric variable
df %>%
  group_by(size_group) %>%
  summarise(
    Mean_Price = mean(unit_price, na.rm = TRUE),
    SD_Price = sd(unit_price, na.rm = TRUE),
    Count = n()
  )

# 5. Independent Two-Sample t-test
# H0: Mean unit price of both size groups is equal
# H1: Mean unit price of both size groups is not equal

print("Independent Two-Sample t-test Result:")

t_test_result <- t.test(unit_price ~ size_group, data = df)
print(t_test_result)

# 6. Decision Based on p-value
if (t_test_result$p.value < 0.05) {
  print("Reject the null hypothesis")
} else {
  print("Fail to reject the null hypothesis")
}
