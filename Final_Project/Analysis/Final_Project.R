library(tidyverse)
library(ggplot2)
library(GGally)
library(broom)
library(fastDummies)

abalone_data <- read_csv(file = "../Data/abalone_data.csv", col_names = 
                         c("Sex", "Length", "Diameter", "Height", "Whole_Weight", "Shucked_Weight",
                           "Viscera_Weight", "Shell_Weight", "Rings"))

#There are two outliers that are more than 3 SDs outside the mean within the Height Variable
#By using Height < 0.3, we are able to remove these two outliers and get much better scatter-
#plots

abalone_data <- abalone_data %>% 
  filter(Height < 0.3) %>% 
  dummy_cols(select_columns = c("Sex"))
  
ggpairs(data = abalone_data)

#Based off a test statistic of -0.861 and an associated p-value of .389, we should eliminate length 
#as a predictor variable within the multivariate regression model

multmod_abalone <- lm(Rings ~ Sex_F + Sex_M + Sex_I + Diameter + Height + Whole_Weight + Shucked_Weight + Viscera_Weight +
                      Shell_Weight, data = abalone_data)

mult_abalone <- tidy(multmod_abalone)
mult_abalone
