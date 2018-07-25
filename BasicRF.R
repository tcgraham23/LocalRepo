
sales_train_csv <- read_csv("C:/Users/Thomas.Graham/Desktop/Kaggle/Predict Future Sales/sales_train.csv.gz",
                            col_types = cols(date = col_date(format = "%m/%d/%Y")))
view(sales_train_csv)
View(sales_train_csv)
library(dplyr)
library(readr)
test_csv <- read_csv("C:/Users/Thomas.Graham/Desktop/Kaggle/Predict Future Sales/test.csv.gz")
View(test_csv)
library(readr)
sales_train_csv <- read_csv("C:/Users/Thomas.Graham/Desktop/Kaggle/Predict Future Sales/sales_train.csv.gz",
                            col_types = cols(date = col_date(format = "%d.%m.%Y")))
View(sales_train_csv)
ggplot(test_csv, aes(x = shop_id, y = item_id)) +
  geom_point()
ggplot(sales_train_csv, aes(x = date_block_num, y = sum(item_cnt_day)) +
         geom_point()
       ggplot(sales_train_csv, aes(x = date_block_num, y = sum(item_cnt_day)) +
                geom_point()
              geom_point()
              sales_mo_itcnt <- sales_train_csv %>%
                group_by(date_block_num) %>%
                mutate(mo_itcnt = sum(item_cnt_day))
              View(sales_mo_itcnt)
              View(sales_mo_itcnt)
              sales_mo_itcnt1 <- sales_train_csv %>%
                group_by(date_block_num, shop_id) %>%
                mutate(mo_itcnt = sum(item_cnt_day))
              View(sales_mo_itcnt1)
              ggplot(sales_mo_itcnt1, aes(x = date_block_num, y = mo_itcnt, color = shop_id))+
                geom_point()
              ggplot(sales_mo_itcnt1, aes(x = date_block_num, y = mo_itcnt))+
                geom_point()
              ggplot(sales_mo_itcnt1, aes(x = date_block_num, y = mo_itcnt))+
                geom_bar()
              View(sales_mo_itcnt1)
              View(sales_mo_itcnt1)
              sales_mo_itcnt <- sales_train_csv %>%
                group_by(date_block_num, shop_id) %>%
                arrange(date_block_num) %>%
                mutate(mo_itcnt = sum(item_cnt_day))
              ggplot(sales_mo_itcnt1, aes(x = date_block_num, y = mo_itcnt))+
                geom_bar()
              ggplot(sales_mo_itcnt1, aes(x = date_block_num, y = mo_itcnt))+
                geom_point()
              sales_train_csv %>%
                summarize(item_price)
              #load in packages and csv files for test and train
              library(caret)
              library(readr)
              sales_train_csv <- read_csv("C:/Users/Thomas.Graham/Desktop/Kaggle/Predict Future Sales/sales_train.csv.gz",
                                          col_types = cols(date = col_date(format = "%m/%d/%Y")))
              library(dplyr)
              #make new dataset with sume
              sales_mo_itcnt <- sales_train_csv %>%
                group_by(date_block_num, shop_id) %>%
                arrange(date_block_num) %>%
                mutate(mo_itcnt = sum(item_cnt_day))
              ggplot(sales_mo_itcnt1, aes(x = date_block_num, y = mo_itcnt, color = shop_id))+
                geom_point()
              ggplot(sales_mo_itcnt, aes(x = date_block_num, y = mo_itcnt, color = shop_id))+
                geom_point()
              View(sales_mo_itcnt)
              View(sales_mo_itcnt)
              ggplot(sales_mo_itcnt, aes(x = date_block_num, y = mo_itcnt))+
                geom_point()
              sales_train_csv <- read_csv("C:/Users/Thomas.Graham/Desktop/Kaggle/Predict Future Sales/sales_train.csv.gz",
                                          col_types = cols(date = col_date(format = "%m.%d.%Y")))
              View(sales_mo_itcnt)
              View(sales_mo_itcnt)
              #load in data, set wd and check structure
              titanic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE, header = TRUE)
              View(titanic.train)
              titanic.test <- read.csv(file = "test.csv", stringsAsFactors = FALSE, header = TRUE)
              str(titanic.test)
              median(titanic.train$Age, na.rm = TRUE)
              #add in column to differentiate data
              titanic.train$IsTrainSet <- TRUE
              titanic.test$IsTrainSet <- FALSE
              ncol(titanic.train)
              ncol(titanic.test)
              names(titanic.train)
              names(titanic.test)
              #create survived column for r bind
              titanic.test$Survived <- NA
              #rbind in to one dataset
              titanic.full <- rbind(titanic.test, titanic.train)
              tail(titanic.full)
              table(titanic.full$Embarked)
              #replace missing in embarked with mode
              titanic.full[titanic.full$Embarked=='', "Embarked"] <- 'S'
              table(titanic.full$Embarked)
              #replace missing in age and fare lm model for age and fare
              #fare is not really needed there is only one NA, just for practice
              #is.na(titanic.full$Age)
              #Fare.median <- median(titanic.full$Fare, na.rm = TRUE)
              #titanic.full[is.na(titanic.full$Fare), "Fare"] <- Fare.median
              #table(is.na(titanic.full$Age))
              #table(is.na(titanic.full$Fare))
              titanic.full[is.na(titanic.full$Age), "Age"]
              titanic.full[is.na(titanic.full$Fare), "Fare"]
              boxplot(titanic.full$Fare)
              boxplot(titanic.full$Age)
              boxplot.stats(titanic.full$Fare)
              boxplot.stats(titanic.full$Age)
              upper.whisker <- boxplot.stats(titanic.full$Fare)$stats[5]
              outlier.filter <- titanic.full$Fare < upper.whisker
              upper.whiskerA <- boxplot.stats(titanic.full$Age)$stats[5]
              outlier.filterA <- titanic.full$Age < upper.whiskerA
              titanic.full[outlier.filter,]
              titanic.full[outlier.filterA,]
              str(titanic.full$Age)
              Age.equasion = "Age ~ Pclass + Sex + Fare + SibSp + Parch + Embarked"
              fare.model <- lm(
                formula = fare.equasion,
                data = titanic.full[outlier.filter,]
              )
              age.model <- lm(
                formula = Age.equasion,
                data = titanic.full[outlier.filterA,]
              )
              age.row <- titanic.full[
                is.na(titanic.full$Age),
                c("Pclass","Sex", "Fare", "SibSp", "Parch", "Embarked")
                ]
              fare.row <- titanic.full[
                is.na(titanic.full$Fare),
                c("Pclass", "Sex","Age", "SibSp","Parch", "Embarked")
                ]
              fare.predictions <- predict(fare.model, newdata = fare.row)
              age.predict <- predict(age.model, newdata = age.row)
              titanic.full[is.na(titanic.full$Fare), "Fare"] <- fare.predictions
              titanic.full[is.na(titanic.full$Age), "Age"] <- age.predict
              #catagorical casting
              str(titanic.full)
              titanic.full$Pclass <- as.factor(titanic.full$Pclass)
              titanic.full$Sex <- as.factor(titanic.full$Sex)
              titanic.full$Embarked <- as.factor(titanic.full$Embarked)
              #split data back to train and test
              titanic.train <-  titanic.full[titanic.full$IsTrainSet==TRUE,]
              titanic.test <- titanic.full[titanic.full$IsTrainSet==FALSE,]
              titanic.train$Survived <- as.factor(titanic.train$Survived)
              str(titanic.train)
              survived.equasion <- "Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked"
              survived.formula <- as.formula(survived.equasion)
              install.packages("randomForest")
              library(randomForest)
              titanic.model <- randomForest(formula = survived.formula, data = titanic.train,
                                            ntree = 500, mtry = 3, nodesize = .01 * nrow(titanic.train))
              features.equasion <- "Pclass + Sex + Age + SibSp + Parch + Fare + Embarked"
              Survived <- predict(titanic.model, newdata = titanic.test)
              Survived
              PassengerId <-titanic.test$PassengerId
              output.dataframe <- as.data.frame(PassengerId)
              output.dataframe$Survived <- Survived
              tail(output.dataframe)
              #load in data, set wd and check structure
              titanic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE, header = TRUE)
              View(titanic.train)
              titanic.test <- read.csv(file = "test.csv", stringsAsFactors = FALSE, header = TRUE)
              str(titanic.test)