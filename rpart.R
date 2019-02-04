d = read.csv("pollution.csv")
attr = c('SO2', 'NO2', 'RSPM.PM10', 'PM.2.5', 'season', 'quarter')
s <- sample(size, .9*size)
attr <- c(attr, 'Type.of.Location.Binary.form')
train <- d[s,attr]
test <- d[-s,attr]
dr<-rpart::rpart(train$Type.of.Location.Binary.form~., train, method = "class")
rpart.plot::rpart.plot(dr)
p<-predict(dr, test, type  = "class")
test$Type.of.Location.Binary.form = d[-s,Type.of.Location.Binary.form]
p<-predict(dr, test, type  = "class")
table(test[,"Type.of.Location.Binary.form"], p)
mean(p==test[,"Type.of.Location.Binary.form"])
