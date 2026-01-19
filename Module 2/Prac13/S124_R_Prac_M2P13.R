# Load required libraries
library(readr)
library(readxl)
library(ggplot2)

# Load the dataset
employee_data <- read_excel("C:\\Users\\info\\Downloads\\Employee_Data.xlsx")

# Display first few rows
head(employee_data)

# Check structure of dataset
str(employee_data)

# Summary statistics
summary(employee_data)

# Multiple Linear Regression Model
# Predict MonthlyIncome
reg_model <- lm(
  MonthlyIncome ~ Age + YearsAtCompany + JobSatisfaction,
  data = employee_data
)

# Display model summary
summary(reg_model)

# Predict Monthly Income
predicted_income <- predict(reg_model, employee_data)

# View first few predictions
head(predicted_income)

# Add predicted values to dataset
employee_data$Predicted_MonthlyIncome <- predicted_income

# View updated dataset
head(employee_data)

# Residuals & Error
# Calculate residuals
residuals_values <- residuals(reg_model)

# View first few residuals
head(residuals_values)

# Mean Squared Error
mse <- mean(residuals_values^2)

# Print MSE
print(mse)

# Actual vs Predicted Regression Plot
ggplot(employee_data, aes(x = MonthlyIncome, y = Predicted_MonthlyIncome)) +
  geom_point(color = "blue", size = 2) +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  labs(
    title = "Actual vs Predicted Monthly Income",
    x = "Actual Monthly Income",
    y = "Predicted Monthly Income"
  ) +
  theme_minimal()
