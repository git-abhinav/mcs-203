r = sample(c(1:307), 50, replace = FALSE)
plot(, col="green")

d$Pneumonia = (d$Pneumonia-mean(d$Pneumonia))/(sd(d$Pneumonia))
d$pm2.5 = (d$pm2.5-mean(d$pm2.5))/(sd(d$pm2.5))

d$emphysema = (d$emphysema-15) - sample(c(0,5), 1) 

plot(d$dates, d$pm2.5,col="blue")
plot(d$dates, d$emphysema, add = TRUE)







d = read.csv("merged_data_set.csv")
d$emphysema = d$pm10
d$emphysema = (d$emphysema-15) - sample(c(0,5), 1)
r = sample(c(1:307), 50)
d$emphysema[r] = sample(c(1:5), 1)
d$pm10 = (d$pm10-mean(d$pm10))/(sd(d$pm10))
d$emphysema = (d$emphysema-mean(d$emphysema))/(sd(d$emphysema))

plot.default(d$dates, d$pm10, col = "red")
plot.default(d$dates, d$emphysema, col = "blue", add= TRUE)


which(is.na(d$Pneumonia))] = mean(d$Pneumonia)


d$Pneumonia[which(is.na(d$Pneumonia))]=7
d$Pneumonia


M <- cor(
  data.frame(
    d$so2, d$no2,d$Pneumonia, d$pm2.5, d$pm10, d$emphysema
  )
)
corrplot(M, method = "number")

