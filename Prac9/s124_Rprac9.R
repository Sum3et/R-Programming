library(stringr)
library(tidyr)
library(dplyr)
library(readxl)

# 1. IMPORT DATASET
spotify <- read_excel("C:\\Users\\info\\Downloads\\spotify_data clean.xlsx")

print("--- Original Dataset (First 5 Rows) ---")
print(head(spotify, 5))

# 2. USING str_sub() (Substring)
spotify$ID_Code <- str_sub(spotify$track_id, 1, 6)
spotify$Year <- str_sub(as.character(spotify$album_release_date), -4, -1)

print("--- Data after str_sub() ---")
print(spotify %>% select(track_id, ID_Code, album_release_date, Year) %>% head(5))

# 3. USING str_split() (Split String)
# Method A: Basic split (list output)
genre_list <- str_split(spotify$artist_genres, ",")
print("--- Basic Split Output (List format) ---")
print(genre_list[[1]])   # show first artist's genre list

# Method B: Split Fixed (Matrix form)
genre_matrix <- str_split(spotify$artist_genres, ",", simplify = TRUE)

spotify$Genre_1 <- genre_matrix[, 1]
spotify$Genre_2 <- genre_matrix[, 2]

print("--- Data after str_split() (Manual Assignment) ---")
print(spotify %>% select(artist_genres, Genre_1, Genre_2) %>% head(5))

# 4. BONUS: Using 'separate' to split track_name
tidy_spotify <- spotify %>% 
  separate(track_name, into = c("Title", "Info"), sep = " - ", fill = "right")

print("--- Bonus: The 'separate' function (Track Title Split) ---")
print(tidy_spotify %>% select(Title, Info) %>% head(5))
