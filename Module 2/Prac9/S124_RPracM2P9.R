library(dplyr)

# 1. Load Dataset
df <- read.csv("C:\\Users\\Rohit\\Downloads\\googleplaystore.csv")
print("Dataset Loaded Successfully")

# 2. Dataset Overview
head(df)
str(df)
summary(df)

# 3. Select Required Categorical Columns
df <- df %>%
  filter(Category %in% c("GAME", "FAMILY", "TOOLS", "BUSINESS"),
         Content.Rating %in% c("Everyone", "Teen", "Mature 17+"))


print("Cleaned Dataset Ready")

# 4. Create Contingency Table
contingency_table <- table(df$Category, df$Content.Rating)

print("Contingency Table:")
contingency_table

# 5. Hypothesis
# H0: App category and content rating are independent
# H1: App category and content rating are dependent

# 6. Perform Chi-Square Test
chi_result <- chisq.test(contingency_table)

print("Chi-Square Test Result:")
chi_result

# 7. Decision Based on p-value
if (chi_result$p.value < 0.05) {
  print("Reject the null hypothesis")
  print("App category and content rating are dependent")
} else {
  print("Fail to reject the null hypothesis")
  print("App category and content rating are independent")
}
