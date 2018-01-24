---
  title: "Digging_Assgt_2"
author: "Anuj Nimkar"
date: "Wednesday, March 04, 2015"
output: html_document 
---
  
  ### Loading in the training and test dataset and setting the working directory 
  ```{r}
setwd('F:/Anuj/Study & Work/Sem 2 Courses/INST 737/Assgts/Assgt 2')
house_Test_data <- read.csv('house_test.csv')
house_Train_data<- read.csv('house_train.csv')     

```  
  

### Exploring the variables of the dataset
```{r}
summary(house_Train_data)

dim(house_Train_data)

str(house_Train_data)

names(house_Train_data) 

```


### Building a linear model to predict the housing prices for 2013 and applying that
### model to the test dataset. 
```{r}

house_lm <- lm(data = house_Train_data, price2013 ~ state)
house_lm

house_Test_data$price2013 <- predict(house_lm,house_Test_data)
write.csv(house_Test_data, file = "Housing2013_Predictions_State.csv", row.names = FALSE)


house_lm1 <- lm(data = house_Train_data, price2013 ~ state + county)
house_lm1 

house_Test_data <- subset(house_Test_data, house_Test_data$county != "grafton" & house_Test_data$county != "harrisonburg city" & house_Test_data$county != "hill" & house_Test_data$county != "hunt" & house_Test_data$county != "bossier" & house_Test_data$county != "gilpin")

house_Test_data$price2013 <- predict(house_lm1,house_Test_data) 
write.csv(house_Test_data, file = "Housing2013_Predictions_State_County.csv", row.names = FALSE)



```
