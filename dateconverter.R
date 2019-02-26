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
  x = paste(d,m,(2000+as.integer(y)))
  x = gsub(" ", "-", x)
  xd[i] = x
  #data$Sampling.Date[i] = x 
}
data$Sampling.Date




