library(dplyr)

#1:Setup
#Dataset 1
data_jan <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Guts", "Griffith", "Sumeet"),
  Jan_Sales = c(100, 150, 200)
)

#Dataset 2
data_feb <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Guts", "Griffith", "Sumeet"),
  Feb_Sales = c(120, 160, 210)
)

#Dataset 3
data_new_hire <- data.frame(
  ID = c(4, 5),
  Name = c("Naruto", "Sasuke"),
  Jan_Sales = c(50, 60)
)

print("--- Data January ---")
print(data_jan)
print("--- Data February ---")
print(data_feb)

#2:Merge
merged_data <- merge(data_jan, data_feb, by = c("ID", "Name"))
print("--- Merged Data (Columns Added) ---")
print(merged_data)

#3:Append
final_list <- bind_rows(data_jan, data_new_hire)

print("--- Appended Data (Rows Added) ---")
print(final_list)
