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





no2 = data$NO2
so2 = data$SO2
pm2.5 = data$PM.2.5
pm10 = data$RSPM.PM10
residentialIndexes = which(data$Type.of.Location == "Residential, Rural and other Areas")
industrialIndexes = which(data$Type.of.Location == "Industrial Area")









barplot(
        c(mean(no2[residentialIndexes]),
        mean(no2[industrialIndexes])), 
        main = "Rural vs Industrial pollution level", 
        ylab = "pollution levels", 
        xlab = "2 types of location in Orrisa", 
        col=c("darkblue","red"), 
        legend = c("NO2 in Rural","NO2 Industrial")
      )


barplot(
  c(mean(so2[residentialIndexes]),
    mean(so2[industrialIndexes])), 
  main = "Rural vs Industrial pollution level", 
  ylab = "pollution levels", 
  xlab = "2 types of location in Orrisa", 
  col=c("darkblue","red"), 
  legend = c("SO2 Rural","SO2 Industrial")
)




barplot(
  c(mean(pm10[residentialIndexes]),
    mean(pm10[industrialIndexes])), 
  main = "Rural vs Industrial pollution level", 
  ylab = "pollution levels", 
  xlab = "2 types of location in Orrisa", 
  col=c("darkblue","red"), 
  legend = c("PM10 in Rural", "PM10 in Industrial")
)
