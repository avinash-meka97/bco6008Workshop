#install.packages('MASS')
#install.packages('ISLR')

library(ISLR)
library(MASS)
library(tidymodels)

set.seed(123)

#1 specify the model: type - mode- engine
lm_spec<-
  linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

data(Boston)

#2 take model specification from step 1 and apply to data = use.fit()
#and put formula y~x
lm_fit<-
  lm_spec%>%
  fit(data=Boston, medv~lstat)

lm_fit

lm_fit%>%
  pluck("fit")%>%
  summary()

tidy(lm_fit)

#3 use the fitted model from step2 to predict new y in new data
predict(lm_fit, new_data = Boston)

# examining new predicted values
final_model<-
  augment(lm_fit, new_data = Boston)






rm(list = ls())

data("Boston")

#1
model_spec<-
  linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

#2
model_fit<-
  model_spec%>%
  fit(data=Boston, medv~age+crim+rm)

#3
model_predicted<-
  predict(model_fit, new_data = Boston)

model_predicted_augment<-
  augment(model_fit, new_data = Boston)





rm(list = ls())

data("Boston")

#1
model_lm_spec<-
  linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

#2  
model_lm_fit<-
  model_lm_spec%>%
  fit(data=Boston, medv~.)

#3
model_lm_augm<-
  augment(model_lm_fit, new_data = Boston)




