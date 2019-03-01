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
plot(x=-9,y=-9,xlim=c(0,length(datatoprint$dates)), ylim=c(-1,5))
points(x=datatoprint$dates, y=normalizedData$no2, col="red")
points(x=datatoprint$dates, y=normalizedData$so2, col="green")
points(x=datatoprint$dates, y=normalizedData$pm2.5, col="blue")
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
H 

