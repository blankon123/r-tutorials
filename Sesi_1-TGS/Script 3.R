# File:    Script 2.R
# Course:  UNJ Pesta Day 2
# Session: 3 - Data Wrangling
# Author:  Thosan Girisona S, bps.go.id, @blankon123
# Date:    2021-09-08

# 1. Load Libraries ################################################
if (!require("pacman"))
  install.packages("pacman")

pacman::p_load(pacman, rio, dplyr, datasets)

# 2. Load Data ################################################
#Look at the data in 'beautiful' format
head(mtcars, 5)
? mtcars
View(mtcars)

#We will make this one beautiful later
plot(mtcars$mpg, mtcars$cyl)

# 3. Select ################################################
mtcars %>%
  select(mpg, cyl, disp) %>%
  head(5)

mtcars %>%
  select(mpg:disp, cylinder = cyl) %>%
  head(5)

mtcars %>%
  select(mpg:disp) %>%
  head(5)

mtcars %>%
  select(mpg:disp, -cyl) %>%
  head(5)

mtcars %>%
  select(-cyl) %>%
  head(5)

# 4. Mutate ################################################
mtcars %>%
  mutate(hpperwt = hp / wt) %>%
  select(hpperwt, hp, wt) %>%
  head(5)

mtcars %>%
  mutate(hpperwt = hp / wt, hpwt = hp * wt) %>%
  select(hpperwt, hpwt, hp, wt) %>%
  head(5)

# 5. Filter ################################################
mtcars %>%
  mutate(hpperwt = hp / wt) %>%
  filter(hpperwt > 40) %>%
  select(hpperwt, hp, wt) %>%
  head(5)

mtcars %>%
  mutate(hpperwt = hp / wt) %>%
  filter(hpperwt > 40, wt < 4) %>%
  select(hpperwt, hp, wt) %>%
  head(5)

# 6. Distincts ################################################
mtcars %>%
  distinct(vs)

mtcars %>%
  distinct(vs) %>%
  .$vs

# 7. Groupby & Summarise ################################################
mtcars %>%
  group_by(cyl) %>%
  summarise(
    max_hp = max(hp),
    min_hp = min(hp),
    mean_hp = mean(hp),
    median_hp = median(hp)
  )

# 8. Arrange ################################################
mtcars %>%
  group_by(cyl) %>%
  summarise(
    max_hp = max(hp),
    min_hp = min(hp),
    mean_hp = mean(hp),
    median_hp = median(hp)
  ) %>%
  arrange(desc(max_hp))

# 9. Count ################################################
mtcars %>%
  count(cyl) %>% 
  arrange(desc(n))

# 10. Exercise ############################################
df = import('https://raw.githubusercontent.com/blankon123/r-tutorials/main/Sesi_1-TGS/top10s.csv')
View(df)

#1. Find the top 10 energetic song,
#   show only the song name, artist, year, and the energy
#   Make sure the song is only show once in the dataframe
#   sort by the most energetic
#   Hint : You can use distinct(x,.keep_all=TRUE) to  filter duplicates based on x column

#2. Find the most 'dance-able' song every year,
#   show only the song name, artist, year, and the dancibility
#   sort by the year ascending and 'dance-able' descending
#   Hint : You can use rank(-x, ties.method = "random") to make a ranking 

#3. Find the most popular song every year every genre,
#   show only the song name, artist, year, and genre
#   sort by the year descending, if they have the same genre, sort by popularity
