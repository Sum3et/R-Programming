# Loading libraries
library(ggplot2)
library(dplyr)
library(readr)

# Loading the dataset
gapminder <- read_csv("C:\\Users\\mvluc\\Downloads\\gapminder.csv")

# View structure
str(gapminder)

#Scatter plot
ggplot(gapminder,
       aes(x = gdp_cap,
           y = life_exp,
           color = continent)) +
  geom_point(alpha = 0.7, size = 2) +
  scale_x_log10() +
  labs(
    title = "Life Expectancy vs GDP per Capita",
    x = "GDP per Capita (log scale)",
    y = "Life Expectancy",
    color = "Continent"
  ) +
  theme_minimal()

#Pie chart
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(total_population = sum(population, na.rm = TRUE)) %>%
  ggplot(aes(x = "", y = total_population, fill = continent)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(
    title = "Population Distribution by Continent (2007)",
    fill = "Continent"
  ) +
  theme_void()

#High-Low Chart
gapminder %>%
  group_by(continent) %>%
  summarise(
    min_life = min(life_exp, na.rm = TRUE),
    max_life = max(life_exp, na.rm = TRUE)
  ) %>%
  ggplot(aes(
    x = continent,
    ymin = min_life,
    ymax = max_life
  )) +
  geom_linerange(size = 2, color = "steelblue") +
  geom_point(aes(y = min_life), color = "red", size = 3) +
  geom_point(aes(y = max_life), color = "darkgreen", size = 3) +
  labs(
    title = "High–Low Chart of Life Expectancy by Continent",
    x = "Continent",
    y = "Life Expectancy"
  ) +
  theme_minimal()


