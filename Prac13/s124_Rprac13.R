library(dplyr)

laptop_df <- read.csv("C:\\Users\\info\\Downloads\\laptop_pricing_dataset.csv")

print("--- Original Dataset (First 10 Rows) ---")
print(head(laptop_df, 10))

duplicate_rows <- laptop_df %>%
  group_by(across(everything())) %>%  
  count() %>%
  filter(n > 1)

print("--- Rows That Are Duplicated (Exact Duplicates) ---")
print(duplicate_rows)

clean_data <- laptop_df %>% distinct()

print("--- Dataset After Removing Exact Duplicate Rows ---")
print(head(clean_data, 10))

char_cols <- names(laptop_df)[sapply(laptop_df, is.character)]

if (length(char_cols) > 0) {
  main_col <- char_cols[1]   # pick first character column
  cat("\nUsing column for unique rows:", main_col, "\n")
  
  unique_laptops <- laptop_df %>% distinct(.data[[main_col]], .keep_all = TRUE)
  
  print("--- Unique Rows Based on Laptop Name (First Occurrence Kept) ---")
  print(head(unique_laptops, 10))
} else {
  print("No character columns found to remove duplicates by name.")
}
