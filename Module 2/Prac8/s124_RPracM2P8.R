library(dplyr)

# 1. Load Dataset
df <- read.csv("C:\\Users\\Rohit\\Downloads\\video_game_reviews.csv")
print("Dataset Loaded Successfully")

# 2. Dataset Overview
head(df)
str(df)
summary(df)

# 3. Select Required Columns
df <- df %>%
  select(Platform, Genre, User.Rating) %>%
  na.omit()

print("Cleaned Dataset Ready")

# 4. Convert to Factors
df$Platform <- as.factor(df$Platform)
df$Genre <- as.factor(df$Genre)

# 5. Check Group Sizes
table(df$Platform, df$Genre)

# 6. Hypothesis
# H01: Platform has no effect on rating
# H02: Genre has no effect on rating
# H03: No interaction between platform and genre

# 7. Perform Two-Way ANOVA
anova_result <- aov(User.Rating ~ Platform * Genre, data = df)

print("Two-Way ANOVA Result:")
summary(anova_result)

# 8. Decision Based on p-values
anova_summary <- summary(anova_result)[[1]]

# FIX: remove extra spaces in row names
rownames(anova_summary) <- trimws(rownames(anova_summary))

p_platform <- anova_summary["Platform", "Pr(>F)"]
p_genre <- anova_summary["Genre", "Pr(>F)"]
p_interaction <- anova_summary["Platform:Genre", "Pr(>F)"]

if (p_platform < 0.05) {
  print("Reject H01: Platform significantly affects rating")
} else {
  print("Fail to reject H01")
}

if (p_genre < 0.05) {
  print("Reject H02: Genre significantly affects rating")
} else {
  print("Fail to reject H02")
}

if (p_interaction < 0.05) {
  print("Reject H03: Interaction effect exists")
} else {
  print("Fail to reject H03")
}
