library(lubridate)
library(dplyr)

taxi_df <- read.csv("C:\\Users\\info\\Downloads\\taxi_tripdata.csv")

cat("\n--- Original Taxi Trip Data (First 6 Rows) ---\n")
print(head(taxi_df))

cat("\n--- Column Names ---\n")
print(colnames(taxi_df))

processed_data <- taxi_df %>%
  mutate(
    # A. Convert character to POSIXct datetime
    Pickup_DT  = ymd_hms(lpep_pickup_datetime),
    Dropoff_DT = ymd_hms(lpep_dropoff_datetime),
    
    # B. Extract components from PICKUP datetime
    Pickup_Date         = as_date(Pickup_DT),                 # Date only
    Pickup_Year         = year(Pickup_DT),                    # Year
    Pickup_Month_Num    = month(Pickup_DT),                   # Month number (1–12)
    Pickup_Month_Name   = month(Pickup_DT, label = TRUE),     # Month name (Jan, Feb…)
    Pickup_Day_Num      = day(Pickup_DT),                     # Day of month
    Pickup_Weekday_Num  = wday(Pickup_DT),                    # 1 = Sunday, 7 = Saturday
    Pickup_Weekday_Name = wday(Pickup_DT, label = TRUE,
                               abbr = FALSE),                 # Sunday, Monday…
    Pickup_Quarter      = quarter(Pickup_DT),                 # Quarter (1–4)
    Pickup_Day_of_Year  = yday(Pickup_DT),                    # Day number in year (1–366)
    
    # Simple components from DROPOFF as example
    Dropoff_Date      = as_date(Dropoff_DT),
    Dropoff_Year      = year(Dropoff_DT),
    Dropoff_Month_Num = month(Dropoff_DT)
  )

cat("\n--- Data with Extracted Date Components (First 10 Rows) ---\n")
print(head(processed_data, 10))

current_time <- now()

cat("\n--- Current System Time Components ---\n")
cat("Current Timestamp:", current_time, "\n")
cat("Current Year:",   year(current_time),  "\n")
cat("Current Month:",  month(current_time), "\n")
cat("Current Day:",    day(current_time),   "\n")
cat("Current Hour:",   hour(current_time),  "\n")
cat("Current Minute:", minute(current_time), "\n")
