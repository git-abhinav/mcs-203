dataSet = read.csv("cpcb_dly_aq_odisha-2015_0 (1).csv")
dataSet$X = NULL
dates = dataSet$Sampling.Date
monthColumn = c()
x = c();
for(i in seq(1, dim(dataSet)[1])){
  monthColumn[i] = as.integer(strsplit(as.character(dates[i]), "-")[[1]][2])
  if(monthColumn[i]>=3 && monthColumn[i] <= 6)
    dataSet$season[i] = "summer"
  else if(monthColumn[i]>=7 && monthColumn[i] <= 9)
    dataSet$season[i] = "rainy"
  else
    dataSet$season[i] = "winter"
  dataSet$quarter[i] = as.integer(monthColumn[i] / 4) + 1
  if(dataSet$Type.of.Location[i] == "Industrial Area")
    x[i] = 0
  else if(dataSet$Type.of.Location[i] == "Residential, Rural and other Areas")
    x[i] = 1
}
dataSet$Type.of.Location.Binary.form = x
write.csv(dataSet, file = "pollution.csv")
