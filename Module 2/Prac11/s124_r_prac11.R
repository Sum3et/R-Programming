library(ggplot2)
library(readr)

team_data <- read_csv("C:\\Users\\Rohit\\OneDrive\\Documents\\Datasets\\TeamMatchTbl.csv")

# Histogram of Blue Team Kills
ggplot(team_data, aes(x = BlueKills)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(
    title = "Histogram of Blue Team Kills",
    x = "Number of Kills (Blue Team)",
    y = "Frequency"
  ) +
  theme_minimal()

# Box Plot of Blue Team Kills
ggplot(team_data, aes(y = BlueKills)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Box Plot of Blue Team Kills",
    y = "Number of Kills (Blue Team)"
  ) +
  theme_minimal()
