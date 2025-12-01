# Load libraries
library(dplyr)
library(tidyr)

# 1. IMPORT DATASET
df <- read.csv("C:\\Users\\Rohit\\OneDrive\\Documents\\Datasets\\netflix_titles.csv", na.strings = c("", "NA"))

print("--- Original Dataset (First 6 rows) ---")
print(head(df))

df_clean <- df %>%
  mutate(
    director = replace_na(director, "Unknown Director"),
    cast = replace_na(cast, "Unknown Cast"),
    country = replace_na(country, "Unknown Country"),
    rating = replace_na(rating, "Not Rated")
  )

print("--- Cleaned Data ---")
print(head(df_clean))

# 2. METHOD A: ARITHMETIC CALCULATIONS
df_calc <- df_clean %>%
  mutate(
    Content_Age = 2025 - release_year
  )

print("--- Method A: Arithmetic (Content Age) ---")
print(df_calc %>% select(title, release_year, Content_Age) %>% head())

# 3. METHOD B: CONDITIONAL LOGIC
df_logic <- df_calc %>%
  mutate(
    Era = case_when(
      Content_Age > 20 ~ "Old",
      Content_Age > 10 ~ "Modern",
      TRUE ~ "Recent"
    ),
    Type_Label = ifelse(type == "Movie", "Film", "Show")
  )

print("--- Method B: Logic Results ---")
print(df_logic %>% select(title, Content_Age, Era, type, Type_Label) %>% head())

# 4. METHOD C: TEXT TRANSFORMATION (paste)
df_text <- df_logic %>%
  mutate(
    Summary = paste(
      title, 
      "-", type, 
      "| Country:", country, 
      "| Rating:", rating
    )
  )

print("--- Method C: Text Transformation ---")
print(head(df_text$Summary))

# 5. FINAL WORKFLOW (All Together)
final_dataset <- df_clean %>%
  mutate(
    Content_Age = 2025 - release_year,
    Era = case_when(
      Content_Age > 20 ~ "Old",
      Content_Age > 10 ~ "Modern",
      TRUE ~ "Recent"
    ),
    Summary = paste0(
      title, " | ", country, 
      " | Released: ", release_year,
      " | Age: ", Content_Age,
      " | ", rating
    )
  )

print("--- Final Combined Dataset ---")
print(head(final_dataset))
