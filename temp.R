x <- seq(0, 4 * pi, 0.1)
n <- length(x)
y1 <- 0.5 * runif(n) + sin(x)
y2 <- 0.5 * runif(n) + cos(x) - sin(x)
plot(x, y1, col = "blue", pch = 20)
points(x, y2, col = "red", pch = 20)
library(ggplot2)
df <- data.frame(x, y1, y2)
ggplot(df, aes(x, y = value, color = variable)) + 
  geom_point(aes(y = y1, col = "y1")) + 
  geom_point(aes(y = y2, col = "y2"))
#
x = datatoprint$dates
y1 = datatoprint$pm2.5
y2 = datatoprint$so2
plot(x, y1, col = "blue", pch = 20)
points(x, y2, col = "red", pch = 20)
nm = datatoprint
#d[,column] = (d[,column]-mean(d[,column]))/(sd(d[,column]))
nm$pm2.5 = (nm$pm2.5-mean(nm$no2))/(sd(nm$pm2.5))
nm$so2 = (nm$so2-mean(nm$so2))/(sd(nm$so2))
y1 = nm$pm2.5
y2 = nm$so2






plot(x, nm$pm2.5)
point(x, nm$so2, col="red")



x 




































# NOW SERIOUS WITH LAMBERGINI (DIVESH SAMJH AYA)

normalizeColumn <- function(column) {
  #column = (column-mean(column))/(sd(column)
  ncolumn = c()
  for(i in seq(1,length(column)))
  {
    ncolumn[i] = (column[i]-mean(column))/(sd(column))
  }
  return(ncolumn)
}
normalizedData = datatoprint
# 2 beacuse no need to date
for(i in seq(2,dim(datatoprint)[2]))
{
  normalizedData[,i] = normalizeColumn(datatoprint[,i])
  cat("sd",sd(normalizedData[,i]),"mean",mean(normalizedData[,i]),"\n")
}
#################
#################
#################
#################
#################
#################
#################
plot(x=-9,y=-9,xlim=c(0,length(datatoprint$dates)), ylim=c(-1,5))
points(x=datatoprint$dates, y=normalizedData$no2, col="red")
points(x=datatoprint$dates, y=normalizedData$so2, col="green")
points(x=datatoprint$dates, y=normalizedData$pm2.5, col="blue")
#################
#################
#################
#################
#################

# FOR OUTLIER CAPPING
capoutlier <- function(column){
  quantiles <- quantile(column, c(.03, .97 ))
  column[column<quantiles[1]] <- quantiles[1]
  column[column>quantiles[2]] <- quantiles[2]
  return(column)
}
# DANGER
#for(i in seq(2,dim(normalizedData)[2]))
#{
#  normalizedData[,i] = capoutlier(normalizedData[,i])
#}


ggplot(datatoprint, aes(x=dates, y=normalizedData$pm10))+
  geom_point(col="red")+
  labs(title="PM10 Levels Over the year")+
  xlab("Over the year")+ 
  ylab("Pollutants Levels")
  

#g <- ggplot(normalizedData, aes(dates))
#g <- g + geom_line(aes(y=normalizedData$pm2.5), colour="red")
#g <- g + geom_line(aes(y=normalizedData$pm10), colour="green")





s = sort(
    sample(seq(1,307),100, replace = FALSE)
)
plot(
     x=-9,
     y=-9,
     xlim=c(0,length(datatoprint$dates)), 
     ylim=c(-2,5),
     main="Yearly pollutants levels",
     xlab="Yealy",
     ylab="Levels",
     
)
lines(
      legend(
            "topleft",
            c("NO2","SO2","PM2.5", "PM10"),
            fill=c("red","green", "blue", "black")
            )
  )
lines(x=datatoprint$dates[s], y=normalizedData$no2[s], col="red")
lines(x=datatoprint$dates[s], y=normalizedData$so2[s], col="green")
lines(x=datatoprint$dates[s], y=normalizedData$pm2.5[s], col="blue")
lines(x=datatoprint$dates[s], y=normalizedData$pm10[s], col="black")






#FOR HEALTH DATA 
h = read.csv("health_data.csv")

nh = h
#for 



indexes = c()
for(i in seq(1,dim(h)[2]))
{
  #s=s[-which(is.na(s))]
  index = which(is.na(h[,i]))
  if(length(index)>0)
  {
    indexes = c(indexes,index)
  }
}
nh = nh[-indexes,]
for(i in seq(3,dim(h)[2]))
{
  nh[,i] = normalizeColumn(nh[,i])
  cat("sd",sd(nh[,i]),"mean",mean(nh[,i]),"\n")
}

s = sample(seq(1, length(nh$dates)), 100)
s = sort(s)
plot(
  x=-9,
  y=-9,
  xlim=c(0,length(datatoprint$dates)), 
  ylim=c(-2,5),
  main="Yearly pollutants levels",
  xlab="Yealy",
  ylab="Levels",
  
)
lines(
  legend(
    "topleft",
    c("NO2", "Cases"),
    fill=c("red","green")
  )
)
lines(x=datatoprint$dates[s], y=normalizedData$no2[s], col="red")
lines(x=datatoprint$dates[s], y=nh$Nephrology[s], col="green")

lines(x=datatoprint$dates[s], y=normalizedData$so2[s], col="green")
lines(x=datatoprint$dates[s], y=normalizedData$pm2.5[s], col="blue")
lines(x=datatoprint$dates[s], y=normalizedData$pm10[s], col="black")






