library(dplyr)
library(tidyr)

# 1. SETUP: Create and Import Data  (NETFLIX DATASET)

# Read data and keep only a few columns for clarity
df <- read.csv("C:\\Users\\info\\Downloads\\netflix_titles.csv",
               na.strings = c("", "NA")) %>%
  select(show_id, type, title, release_year, rating, duration) %>%
  # make release_year and rating the same type so pivot_longer can combine them
  mutate(
    release_year = as.character(release_year),
    rating       = as.character(rating)
  )

print("--- 1. Original Wide Data ---")
print(head(df))

# 2. PIVOT_LONGER (Wide to Long)
long_df <- df %>%
  pivot_longer(
    cols      = c(release_year, rating),  # The columns we want to stack
    names_to  = "Metric",                 # New column containing the old names
    values_to = "Value"                   # New column containing the values
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 6))

# 3. PIVOT_WIDER (Long to Wide)
wide_df <- long_df %>%
  pivot_wider(
    names_from  = Metric,   # Column that has the new header names
    values_from = Value     # Column that fills the cell values
  )

print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))

# 4. ADVANCED EXAMPLE (Reshaping for Reporting)
df_clean <- df %>%
  mutate(
    rating = ifelse(is.na(rating) | rating == "", "Unknown", rating),
    type   = ifelse(is.na(type)   | type   == "", "Unknown", type)
  )

rating_counts <- df_clean %>%
  count(type, rating, name = "Count")

print("--- 4A. Long Table: Count by Type & Rating ---")
print(head(rating_counts))

rating_pivot <- rating_counts %>%
  pivot_wider(
    names_from  = rating,
    values_from = Count,
    values_fill = 0
  )

print("--- 4B. Wide Rating Table (Type x Rating) ---")
print(head(rating_pivot))

