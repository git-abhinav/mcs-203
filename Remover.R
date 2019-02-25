# TO REMOVE MISSING VALUES FROM THE DATASET
data = read.csv("pollution.csv")
a = c("SO2", "NO2", "RSPM.PM10", "PM.2.5")
d = data[a]
tobedeletdrows = c()
for(i in seq(1:length(a)))
{
  tobedeletdrows = c(tobedeletdrows, which(is.na(d[i])))
}
data = data[-tobedeletdrows,]