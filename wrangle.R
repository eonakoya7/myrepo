# Elijah, Onakoya

rm(list= ls())
library(tidyverse)

#Question 1#

#Part A#
fastfoodData <-read.csv("datasets/fastfood.csv", stringsAsFactors = TRUE)
summary(fastfood)

#Part B#

mcdonaldsData <- filter(fastfood, restaurant == "Mcdonalds")
summary(mcdonaldsData)

#Answer: The 25th percentile of cal_fat is 160 and the 75th percentile is 320

#Part C#

dairyqueenData <- filter(fastfood,restaurant == "Dairy Queen")
summary(dairyqueenData)

#Answer: The 25th percentile of cal_fat is 160 and the 75th percentile is 310

#Part D#

dqMcData <- filter(fastfood,restaurant == "Dairy Queen" | restaurant == "Mcdonalds")

#Part E#

ggplot(dqMcData, aes(x = restaurant, y = cal_fat)) +
  geom_boxplot()

#Part F#
filter(fastfood,restaurant == "Dairy Queen" | restaurant == "Mcdonalds") %>%
  group_by(restaurant) %>%
  summarize(
    min    = min(cal_fat, na.rm = TRUE),
    Q1     = quantile(cal_fat, 0.25, na.rm = TRUE),
    median = median(cal_fat, na.rm = TRUE),
    mean   = mean(cal_fat, na.rm = TRUE),
    Q3     = quantile(cal_fat, 0.75, na.rm = TRUE),
    max    = max(cal_fat, na.rm = TRUE)
  )
    
    
#Part G#
#Answer: McDonalds has more skewed distribution of calories from fat

#1: McDoanlds mean is higher than the median (Mean: 285.6 vs Median: 240) which indicates
# a right skew. Dairy Queens mean (260.5) is closer to the median (220) compared to 
# McDonalds

#2: McDoanlds has 6 outliers while DQ on has 3. McDonalds outliners are also considerably
# higher than DQ. McDonalds has exterme outliers up to 1270 cal fat
# and DQ highest value of 670 

# McDonalds upper tail is longer than the lower tail. McDonalds spread (950) vs DQ spread (360)