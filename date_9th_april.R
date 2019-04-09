data = read.csv("pollution_with_no_na_and_date_as_what_i_wanted.csv")


#dates wise mean
no2 = c()
for(i in seq(1,dim(data)[1]))
{
  indexes = which(data$Sampling.Date == data$Sampling.Date[i]) 
  means = mean(data$NO2[indexes])
  no2[i] = means
}
####
pm2.5 = c()
for(i in seq(1,dim(data)[1]))
{
  indexes = which(data$Sampling.Date == data$Sampling.Date[i]) 
  means = mean(data$PM.2.5[indexes])
  pm2.5[i] = means
}
######
pm10 = c()
for(i in seq(1,dim(data)[1]))
{
  indexes = which(data$Sampling.Date == data$Sampling.Date[i]) 
  means = mean(data$RSPM.PM10[indexes])
  pm10[i] = means
}
#########
so2 = c()
for(i in seq(1,dim(data)[1]))
{
  indexes = which(data$Sampling.Date == data$Sampling.Date[i]) 
  means = mean(data$SO2[indexes])
  so2[i] = means
}



# xlab = "Month", ylab = "Rain fall"

plot(x=data$Sampling.Date, y=no2, xlab = "Dates", ylab = "NO2 levels", main = "NO2 levels over the year 2015")
plot(x=data$Sampling.Date, y=pm2.5, xlab = "Dates", ylab = "PM2.5 levels", main = "PM2.5 levels over the year 2015")
plot(x=data$Sampling.Date, y=pm10, xlab = "Dates", ylab = "PM10 levels", main = "PM10 levels over the year 2015")
plot(x=data$Sampling.Date, y=so2, xlab = "Dates", ylab = "S02 levels", main = "SO2 levels over the year 2015")



