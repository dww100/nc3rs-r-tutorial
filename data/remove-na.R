train <- read.csv('titanic-train.csv')
has_age <- train[!is.na(train$Age), ]
write.csv(has_age, file='validated.csv', row.names=FALSE)