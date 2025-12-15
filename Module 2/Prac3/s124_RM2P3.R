library(dplyr)

# 1. Load Dataset
df <- read.csv("C:\\Users\\IT\\Downloads\\crypto_yearly_performance.csv")
print("Dataset Loaded Successfully")

head(df)
str(df)
dim(df)

# 3. Create a Categorical Variable (IMPORTANT)
df$return_group <- cut(
  df$total_return,
  breaks = c(-Inf, 50, 100, 500, Inf),
  labels = c("Low Return", "Moderate Return", "High Return", "Very High Return")
)

print("Return Group Distribution:")
table(df$return_group)

# 4. Cross Tabulation using table()
print("Cross Tabulation: Symbol vs Return Group")

cross_tab <- table(df$symbol, df$return_group)
print(cross_tab)

# 5. Row-wise Proportions
print("Row-wise Proportions:")
prop.table(cross_tab, margin = 1)

# 6. Column-wise Proportions
print("Column-wise Proportions:")
prop.table(cross_tab, margin = 2)

# 7. Cross Tabulation using dplyr
print("Cross Tabulation using dplyr::count():")

df %>%
  count(symbol, return_group)
