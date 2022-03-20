library(tidyverse)
library(ggplot2)
library(GGally)
library(broom)

poker_data <- read_csv(file = "../Data/poker-hand-testing_data.csv", col_names = 
                         c("Suit_1", "Rank_1", "Suit_2", "Rank_2", "Suit_3", "Rank_3",
                           "Suit_4", "Rank_4", "Suit_5", "Rank_5", "Class"))

ggpairs(data = poker_data, na.rm = F)

multmod_poker <- lm(Class ~ Suit_1 + Rank_1 + Suit_2 + Rank_2 + Suit_3 + Rank_3 +
                      Suit_4 + Rank_4 + Suit_5 + Rank_5, data = poker_data)

mult_poker <- tidy(multmod_poker)
mult_poker
