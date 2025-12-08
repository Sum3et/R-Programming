library(dplyr)

delivery_df <- read.csv("C:\\Users\\info\\Downloads\\Delivery_Logistics.csv")

print("--- Data Loaded (First 6 Rows) ---")
print(head(delivery_df))

print("--- OUTPUT OF str() ---")
str(delivery_df)

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(delivery_df)

char_cols <- names(delivery_df)[sapply(delivery_df, is.character)]

if (length(char_cols) > 0) {
  cat("\nConverting column to factor:", char_cols[1], "\n")
  delivery_df[[char_cols[1]]] <- as.factor(delivery_df[[char_cols[1]]])
}

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(delivery_df)

num_cols <- names(delivery_df)[sapply(delivery_df, is.numeric)]

if (length(num_cols) > 0) {
  first_num <- num_cols[1]
  cat("\nUsing numeric column for summaries:", first_num, "\n")
  
  avg_value <- mean(delivery_df[[first_num]], na.rm = TRUE)
  max_value <- max(delivery_df[[first_num]], na.rm = TRUE)
  
  print(paste("Average of", first_num, ":", avg_value))
  print(paste("Maximum of", first_num, ":", max_value))
} else {
  cat("\nNo numeric columns found to calculate mean / max.\n")
}
