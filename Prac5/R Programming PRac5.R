# Load the dplyr package
library(dplyr)

# Load your dataset
super <- read.csv("C:\\Users\\Rohit\\Downloads\\Supermarket Sales 2.csv")
names(super) <- make.names(names(super))

# Example 1: Sorting by a Single Variable
# Sort by Unit price in ascending order (lowest to highest)
super_sorted_unitprice <- super |>
  arrange(Unit.price)

# Check the first 5 rows—notice the low unit prices
head(super_sorted_unitprice, 5)

# Example 2: Sorting by a Single Variable (Descending)
# Find the transactions with the highest quantity
super_sorted_qty_desc <- super |>
  arrange(desc(Quantity))

# Check the first 5 rows—notice the high quantities
head(super_sorted_qty_desc, 5)

# Example 3: Sorting by Two Variables
# Sort first by Branch, then by Unit price in descending order
super_multi_sort <- super |>
  arrange(Branch, desc(Unit.price))

# The results show Branch-wise sorting, then by highest Unit price
head(super_multi_sort, 10)

# Example 4: Combined Filter and Sort
# Filter customers who bought more than 5 items and arrange by Rating
big_buyers_by_rating <- super |>
  filter(Quantity > 5) |>
  arrange(Rating)

cat("Top 5 customers with Quantity > 5 and lowest Rating:\n")
print(big_buyers_by_rating |> select(Quantity, Rating, Unit.price, Branch) |> head(5))
