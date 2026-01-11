# Load required libraries
library(ggplot2)
library(readr)
library(dplyr)

# Read CSV file
data <- read_csv("~//Datasets//netflix_titles.csv")

# View structure
str(data)
ggplot(data, aes(x = type)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Distribution of Content on Netflix",
    x = "Content Type",
    y = "Count"
  ) +
  theme_minimal()
