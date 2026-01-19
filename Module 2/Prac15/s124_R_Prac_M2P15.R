# Load library
library(writexl)

# Model summary
model_summary <- summary(model)

# Convert coefficients to data frame
results <- as.data.frame(model_summary$coefficients)

# Add variable names as a column (important for interpretation)
results$Variable <- rownames(results)
rownames(results) <- NULL

# Rename columns for clarity (dataset-specific, not logic change)
colnames(results) <- c(
  "Estimate",
  "Std_Error",
  "Z_value",
  "P_value",
  "Variable"
)

# Reorder columns
results <- results[, c("Variable", "Estimate", "Std_Error", "Z_value", "P_value")]

# 1. Write CSV
write.csv(
  results,
  "texas_house_prices_logistic_results.csv",
  row.names = FALSE
)

# 2. Write Excel
write_xlsx(
  results,
  "texas_house_prices_logistic_results.xlsx"
)

# 3. Write PDF
pdf("texas_house_prices_logistic_results.pdf", width = 8, height = 10)
plot.new()
text(
  0, 1,
  paste(capture.output(print(results)), collapse = "\n"),
  adj = c(0, 1),
  cex = 0.7
)
dev.off()
