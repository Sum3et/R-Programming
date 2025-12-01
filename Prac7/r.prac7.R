library(dplyr)

#1. Import the CSV file
housing <- read.csv("C:\\Users\\info\\Desktop\\shopping_behavior_updated.csv")
print("--- Original Dataset (First 3 rows) ---")
print(head(shopping, 3))

#2. SELECTING VARIABLES
# Method A: Select specific columns by name
selected_cols <- shopping %>%
  select(Age, Gender, Category)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

# Method B: Select a range of adjacent columns
range_cols <- housing %>%
  select(Shipping.Type:Size)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

# Method C: Select using helper functions
starts_with_r <- shopping %>%
  select(starts_with("r"))

print("--- Selected columns starting with 'r' ---")
print(head(starts_with_r, 3))

#3. DROPPING VARIABLES
# Method A: Drop a single specific column
dropped_one <- shopping %>%
  select(-Location)

print("--- Dataset with 'Location' dropped ---")
print(names(dropped_one)) 

# Method B: Drop multiple columns
dropped_multiple <- shopping %>%
  select(-Color, -Season)

print("--- Dataset with 'Color' and 'Season' dropped ---")
print(names(dropped_multiple))

# Method C: Drop a range of columns
dropped_range <- shopping %>%
  select(-(Payment.Method:Discount.Applied))

print("--- Dataset with range 'Payment' to 'Discount' dropped ---")
print(names(dropped_range))










