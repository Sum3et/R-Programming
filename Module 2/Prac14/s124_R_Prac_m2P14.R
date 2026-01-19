# 1. Load Dataset
data <- read.csv("C:\\Users\\info\\Downloads\\house_prices_Texas_counties.csv")
print("Dataset Loaded Successfully")

# 2. Remove unwanted unnamed columns
data <- data[, !grepl("^Unnamed", names(data))]

# 3. Dataset overview
head(data)
str(data)
summary(data)

# 4. Create Binary Outcome Variable (High vs Low Price)
median_price <- median(data$Price, na.rm = TRUE)
data$HighPrice <- ifelse(data$Price > median_price, 1, 0)

# Convert Location to factor
data$Location <- as.factor(data$Location)

# 5. Logistic Regression Model (FIXED column name)
model <- glm(
  HighPrice ~ Bedroom + Bathroom + Total.Sqft + Location,
  data = data,
  family = binomial
)

# 6. Model Summary
summary(model)

# 7. Predictions
logit_values <- predict(model, type = "link")
prob_values  <- predict(model, type = "response")

# 8. Plot Logistic Regression Curve
plot(
  logit_values,
  prob_values,
  pch = 19,
  col = "blue",
  main = "Logistic Regression: High vs Low House Prices",
  xlab = "Logit (Linear Predictor)",
  ylab = "Predicted Probability"
)

# 9. Add Sigmoid Curve
logit_seq <- seq(min(logit_values), max(logit_values), length.out = 200)
sigmoid <- 1 / (1 + exp(-logit_seq))
lines(logit_seq, sigmoid, col = "red", lwd = 2)
