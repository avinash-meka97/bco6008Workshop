library(tidymodels)
library(skimr)
library(janitor)
library(tidyverse)

recipes_cupcakes_muffins <-
  read_csv("https://raw.githubusercontent.com/adashofdata/muffin-cupcake/master/recipes_muffins_cupcakes.csv")

recipes_cupcakes_muffins%>%skim()

#clean variable names
cupcakes_muffins <-
  recipes_cupcakes_muffins %>%
  clean_names()

cupcakes_muffins%>%count(type)

#splitting the clean dataset into training and testing
cupcakes_muffins_split <-
  initial_split(cupcakes_muffins)

cupcakes_muffins_split

#save training and testing datasets separately
cupcakes_muffins_training <-
  training(cupcakes_muffins_split)

cupcakes_muffins_testing <-
  testing(cupcakes_muffins_split)

#create a recipe
muffin_recipe <-
  recipe(type~flour+milk+sugar+egg, data = cupcakes_muffins_training)

muffin_recipe

muffin_recipe_steps <- muffin_recipe %>%
  step_impute_mean(all_numeric()) %>%
  step_center(all_numeric()) %>%
  step_scale(all_numeric())

muffin_recipe_steps  

#prep the recipe
prepped_recipe <- 
  prep(muffin_recipe_steps,
       training = cupcakes_muffins_training)

prepped_recipe  

#bake
muffin_training_preprocessed <-
  bake(prepped_recipe, cupcakes_muffins_training)
  
muffin_testing_preprocessed <-
  bake(prepped_recipe, cupcakes_muffins_testing)  
  
  
  