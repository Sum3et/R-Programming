library(dplyr)

df <- read.csv("C:\\Users\\IT\\Downloads\\youtube_tech_channels_20251120_133753.csv")

print("Dataset Loaded Successfully")

# 2. Dataset Overview
head(df)
str(df)

# 3. Create a Categorical Variable
df$subscriber_group <- ifelse(
  df$subscribers >= 1000000,
  "1M+ Subscribers",
  "Below 1M Subscribers"
)

print("Subscriber Group Distribution:")
table(df$subscriber_group)

# 4. Frequency Table using table()
print("Frequency Table: Country")
country_freq <- table(df$country)
print(country_freq)

# 5. Frequency Table using dplyr::count()
print("Frequency Table: Subscriber Group")
subscriber_freq <- df %>% count(subscriber_group)
print(subscriber_freq)

# 6. Cross Tabulation (Two-Way Table)
print("Cross Tabulation: Country vs Subscriber Group")
cross_tab <- table(df$country, df$subscriber_group)
print(cross_tab)

# 7. Row-wise and Column-wise Proportions
print("Row-wise Proportions:")
prop.table(cross_tab, margin = 1)

print("Column-wise Proportions:")
prop.table(cross_tab, margin = 2)

