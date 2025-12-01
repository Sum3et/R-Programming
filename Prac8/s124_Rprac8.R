library(dplyr)
library(tidyr)

# 1. CREATE AND IMPORT DATASET
# Read dataset
taxi_df <- read.csv("C:\\Users\\info\\Downloads\\taxi_tripdata.csv", na.strings = c("", "NA"))

print("--- 1. Original Data (First 6 Rows) ---")
print(head(taxi_df))

print("--- Count of Missing Values per Column ---")
print(colSums(is.na(taxi_df)))

# 2. METHOD A: REMOVE MISSING VALUES (na.omit)
clean_omit <- na.omit(taxi_df)

print("--- 2. Data after na.omit() ---")
print(paste("Original rows:", nrow(taxi_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))

# 3. METHOD B: REPLACE MISSING VALUES (replace_na)
# Calculate average price (ignoring NAs) to use for filling avg_price <- mean(retail_df$Price, na.rm = TRUE)
clean_replace <- taxi_df %>%
  replace_na(list(
    VendorID = 1,
    trip_distance = 0,
    passenger_count = 1,
    fare_amount = 7
  ))

print("--- 3. Data after replace_na() ---")
print(clean_replace[3, ]) 
print(head(clean_replace))
print("--- Remaining NAs after replacement ---")
print(colSums(is.na(clean_replace))
      
