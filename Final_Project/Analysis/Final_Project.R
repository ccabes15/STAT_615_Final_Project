library(tidyverse)
library(ggplot2)
library(GGally)
library(broom)

abalone_data <- read_csv(file = "../Data/abalone_data.csv", col_names = 
                         c("Sex", "Length", "Diameter", "Height", "Whole_Weight", "Shucked_Weight",
                           "Viscera_Weight", "Shell_Weight", "Rings"))

ggpairs(data = abalone_data)

multmod_abalone <- lm(Rings ~ Sex + Length + Diameter + Height + Whole_Weight + Shucked_Weight + Viscera_Weight +
                      Shell_Weight, data = abalone_data)

mult_abalone <- tidy(multmod_abalone)
mult_abalone
