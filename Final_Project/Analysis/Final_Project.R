library(tidyverse)
library(ggplot2)
library(GGally)
library(broom)

abalone_data <- read_csv(file = "../Data/abalone_data.csv", col_names = 
                         c("Sex", "Length", "Diameter", "Height", "Whole_Weight", "Shucked_Weight",
                           "Viscera_Weight", "Shell_Weight", "Rings"))

#There are two outliers that are more than 3 SDs outside the mean within the Height Variable
# By using Height < 0.3, we are able to remove these two outliers and get much better scatter-
#plots

sd(abalone_data$Height)
mean(abalone_data$Height)

abalone_data %>% 
  filter(Height < 0.3) %>% 
  ggpairs()

multmod_abalone <- lm(Rings ~ Length + Diameter + Height + Whole_Weight + Shucked_Weight + Viscera_Weight +
                      Shell_Weight, data = abalone_data)

mult_abalone <- tidy(multmod_abalone)
mult_abalone

sd(abalone_data$Height)
mean(abalone_data$Height)

