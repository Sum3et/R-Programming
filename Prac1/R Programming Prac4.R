library(dplyr)
library(readr)

Olympics <- read_csv("C:\\Users\\Rohit\\Downloads\\Olympics.csv")

#Quick look at the dataset
head(Olympics)
summary(Olympics)

# Example 1: Single Condition
# Athletes taller than 180 cm
tall_athletes <- subset(Olympics, height > 180)
cat("Tall athletes (>180cm):", nrow(tall_athletes), "\n")
summary(tall_athletes$height)

# Example 2: Multiple Conditions (AND)
# Height > 180 AND Weight > 80
tall_heavy_athletes <- subset(Olympics, height > 180 & weight > 80)
cat("Tall & Heavy athletes:", nrow(tall_heavy_athletes), "\n")
head(tall_heavy_athletes)


# Example 3: Multiple Conditions (OR)
# Female OR Very Tall (>190cm)
female_or_very_tall <- subset(Olympics, gender == "Female" | height > 190)
cat("Female OR >190 cm:", nrow(female_or_very_tall), "\n")
head(female_or_very_tall)

#METHOD 2 — dplyr::filter
# Example 1: Single Condition
# Filter Mexican Athletes
mex_athletes <- Olympics |>
  filter(country_code == "MEX")
cat("Mexican Athletes:", nrow(mex_athletes), "\n")

# Example 2: Multiple Conditions (AND)
# Male AND Weight > 85
heavy_male <- Olympics |>
  filter(gender == "Male", weight > 85)
cat("Heavy Male Athletes:", nrow(heavy_male), "\n")
head(heavy_male)

# Example 3: %in% Operator
# Athletes from MEX, USA, IND
selected_countries <- Olympics |>
  filter(country_code %in% c("MEX", "USA", "IND"))
cat("Athletes from selected countries:", nrow(selected_countries), "\n")
table(selected_countries$country_code)

# Example 4: Search by Discipline
# Athletes participating in Archery
archery_athletes <- Olympics |>
  filter(grepl("Archery", disciplines))
cat("Archery Athletes:", nrow(archery_athletes), "\n")
head(archery_athletes)
