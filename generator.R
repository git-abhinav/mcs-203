# data generator 
dates = seq(as.Date('2015/01/01'), as.Date('2015/12/31'), by="day") #whole year data
cases = c("Nephrology", "G.I. Surgery", 
          'Orthopaedic', "Cardiology", "Psychiatry", 
          "Paediatric", "Chronic Obstructive Pulmonary Disease", 
          "Pneumonia", "emphysema")
df = data.frame(
  "dates"=dates,
  "Nephrology"=sample(seq(0,15), 365, replace = TRUE),
  "G.I. Surgery"=sample(seq(0,15), 365, replace = TRUE),
  'Orthopaedic'=sample(seq(0,15), 365, replace = TRUE),
  "Cardiology"=sample(seq(0,15), 365, replace = TRUE),
  "Psychiatry"=sample(seq(0,15), 365, replace = TRUE),
  "Paediatric"=sample(seq(0,15), 365, replace = TRUE),
  "Chronic Obstructive Pulmonary Disease"=sample(seq(0,15), 365, replace = TRUE),
  "Pneumonia"=sample(seq(0,15), 365, replace = TRUE),
  "emphysema"=sample(seq(0,15), 365, replace = TRUE)
)
#rr = sample(seq(1,365), 5)
#rc = sample(seq(2,length(cases)), 3)
#df[rr, rc] = NA
write.csv(df, "health_data.csv")







### add biasness

h = read.csv("health_data.csv")
h_dates = h$dates
#for(i in seq(1,length(h_dates)))
#{
#  h_month = strsplit(as.character(h_dates[1]),"-")[[1]][2]
#  if(h_month<3 || h_month>9)
#  {
    for(j in seq(1, dim(h)[2]))
    {
      if(j!=2)
      {
        randombias = sample(seq(1,8), 1)
        h[c(1:60,300:365),j] = h[c(1:60,300:365),j] + randombias
      }
    }
  
#}
#}

write.csv(h, "health_data_orrisa.csv")




qplot(h$dates[s],h$Nephrology[s], geom='smooth', span =0.00005)
qplot(datatoprint$dates,datatoprint$no2, geom='smooth', span =50)


plot(h$dates[s],h$Nephrology[s],type="l",xlim=c(0, 200), ylim=c(0, 200))


####################
plot(0,0,xlim=c(0, 100), ylim=c(0, 100),main="Yearly cases vs PM level\nRed is PM LEVEL and black is cases", 
     xlab="Yearly", ylab="Cases and PM level")

lines(datatoprint$dates, datatoprint$pm2.5,col="red")
lines(h$dates, h$Nephrology)
h$Nephrology[1:40] = h$Nephrology[1:40]-5

title()
