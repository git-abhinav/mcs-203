d = read.csv("pollution_with_no_na.csv")
q1 = which(d$quarter==1)
q2 = which(d$quarter==2)
q3 = which(d$quarter==3)
q4 = which(d$quarter==4)
attr = c("SO2", "NO2", "RSPM.PM10", "PM.2.5")
q1 = d[q1, attr]
q2 = d[q2, attr]
q3 = d[q3, attr]
q4 = d[q4, attr]

so2m1 = mean(q1$SO2)
so2m2 = mean(q2$SO2)
so2m3 = mean(q3$SO2)
so2m4 = mean(q4$SO2)
plot(seq(1,4), c(so2m1,so2m2,so2m3,so2m4))


no2m1 = mean(q1$NO2)
no2m2 = mean(q2$NO2)
no2m3 = mean(q3$NO2)
no2m4 = mean(q4$NO2)
plot(seq(1,4), c(no2m1,no2m2,no2m3,no2m4))


PM.2.5m1 = mean(q1$PM.2.5)
PM.2.5m2 = mean(q2$PM.2.5)
PM.2.5m3 = mean(q3$PM.2.5)
PM.2.5m4 = mean(q4$PM.2.5)
plot(seq(1,4), c(PM.2.5m1,PM.2.5m2,PM.2.5m3,PM.2.5m4))


df1 = data.frame(
  "quarters" = seq(1,4),
  "values" = c(so2m1,so2m2,so2m3,so2m4)
)

#library(ggplot2)
#theme_set(theme_classic())
#g <- ggplot(d, aes(NO2))
#g + geom_density(aes(fill=factor(cyl)), alpha=0.8) + 
#  labs(title="Density plot", 
#       subtitle="City Mileage Grouped by Number of cylinders",
#       caption="Source: mpg",
#       x="City Mileage",
#       fill="# Cylinders")



df2 = data.frame(
  values=c(q1$SO2,q2$SO2,q3$SO2,q4$SO2)
)


ggplot(data = d, mapping = aes(y = SO2, x = 	City.Town.Village.Area	)) +
  geom_point()
























data = read.csv("pollution_with_no_na.csv")
# date converter 
dt = data$Sampling.Date
xd = c()
for(i in seq(1,length(dt))){
  d = strsplit(as.character(dt[i]),"-")[[1]][1]
  m = strsplit(as.character(dt[i]),"-")[[1]][2]
  y = strsplit(as.character(dt[1]),"-")[[1]][3]
  x = paste((2000+as.integer(y)), m,d)
  x = gsub(" ", "-", x)
  xd[i] = x
  #data$Sampling.Date[i] = x 
}
data$Sampling.Date= xd
write.csv(data, "pollution_with_no_na_and_date_as_what_i_wanted.csv")








#MAIN PART BRO
data = read.csv("pollution_with_no_na_and_date_fine.csv")
alldates = seq(as.Date('2015/01/01'), as.Date('2015/12/31'), by="day")

tempdata = data

datatoprint = data.frame(
  dates = c(),
  no2 = c(),
  so2 = c(),
  pm2.5 = c(),
  pm10 = c()
)


d = c()
no2 = c()


so2 = c()
pm2.5 = c()


pm10 = c()

j = 0




for(i in seq(1,length(alldates)))
{
    whichallhave = which(alldates[i]==as.character(data$Sampling.Date))
    if(length(whichallhave)>0)
    {
      cat("mathc")
      j = j+1
      d[j] = as.character(alldates[i])
      no2[j]=mean(data$NO2[whichallhave])
      so2[j]=mean(data$SO2[whichallhave])
      pm2.5[j]=mean(data$PM.2.5[whichallhave])
      pm10[j]=mean(data$RSPM.PM10[whichallhave])
    }
}


datatoprint = data.frame(
  "dates"=d,
  "no2"=no2,
  "so2"=so2,
  "pm2.5"=pm2.5,
  "pm10"=pm10
)
















ggplot(datatoprint, aes(x=dates, y=so2))+
  geom_point(col="red")
  



ggplot(head(datatoprint), aes(dates, y= c(no2,so2)) +
  geom_point(col=c("red","green")) 



#ggplot(datatoprint, aes(x=dates, y = so2, color = "red"))
#geom_point(aes(y = no2, col = "green"))
#geom_point(aes(y = pm10, col = "blue"))




#ggplot(data = d, mapping = aes(y = SO2, x = 	City.Town.Village.Area	)) +
#  geom_point()

ggplot(datatoprint, aes(x = dates, y = no2)) +
  geom_point() +
  stat_smooth()
  







g <- ggplot(datatoprint, aes(dates))
g <- g + geom_line(aes(y=no2), colour="red")
g <- g + geom_line(aes(y=so2), colour="green")























# This is final 
# dates are like-year month date
monthIndex = c()
counter = 1
m = c()
for(i in seq())
{
  if()
}

#FOR NO2 
ggplot(head(datatoprint), aes(x=dates, y=so2))+
geom_bar(stat="identity")




#TO GET MEAN FROM ALL THE MONTHS
p=1
m=c()
no2m = c()
for(i in seq(1,length(datatoprint)))
{
  month=as.integer(strsplit(as.character(datatoprint$dates[1]), "-")[[1]][2])
  strsplit(as.character(datatoprint$dates[1]), "-")[[1]][2]
  if(p!=month)
  {
    m=c()
  }
  
  
}



#FORSO2
ggplot(datatoprint, aes(x=dates, y=so2))+
  geom_point(col="black")+
  labs(title="SO2 Levels Overthe year")+
  xlab("Over the year")+ 
  ylab("Pollutants Levels")



#FORNO2
ggplot(datatoprint, aes(x=dates, y=no2))+
geom_point(col="blue")+
labs(title="NO2 Levels Overthe year")+
xlab("Over the year")+ 
ylab("Pollutants Levels")

#FORPM2.5

ggplot(datatoprint, aes(x=dates, y=pm2.5))+
geom_point(col="green")+
labs(title="PM2.5 Levels Over the year")+
xlab("Over the year")+ 
ylab("Pollutants Levels")


#FOR PM10
ggplot(datatoprint, aes(x=dates, y=pm10))+
geom_point(col="red")+
labs(title="PM10 Levels Over the year")+
xlab("Over the year")+ 
ylab("Pollutants Levels")

