pdata = read.csv("pollution_with_no_na_and_date_as_what_i_wanted.csv")
attribute_to_remove = c("State", "X", "X.1", "Agency", "X.2")
indexes_to_remove = c()
for(i in seq(1, length(attribute_to_remove)))
{
  indexes_to_remove[i] = which(names(pdata) == attribute_to_remove[i])
}
pdata = pdata[,-indexes_to_remove]


# SO2	NO2	RSPM.PM10	PM.2.5	

# for overall view of orrisa 

dates = c()
so2 = c()
no2 = c()
pm10 = c()
pm2.5 = c()

unique_dates = unique(pdata$Sampling.Date)
indexes = c()
for(i in seq(1, length(unique_dates)))
{
  indexes = which(pdata$Sampling.Date == unique_dates[i])
  dates[i] = as.character(unique_dates[i])
  so2[i] = mean(pdata$SO2[indexes])
  no2[i] = mean(pdata$NO2[indexes])
  pm10[i] = mean(pdata$RSPM.PM10[indexes])
  pm2.5[i] = mean(pdata$PM.2.5[indexes])
}


sum_data = data.frame(
  dates = dates,
  so2 = so2,
  no2 = no2,
  pm10 = pm10,
  pm2.5 = pm2.5
)

write.csv(sum_data, "yearly_data_orrisa.csv")
sum_data = read.csv("yearly_data_orrisa.csv")

h = read.csv("health_data.csv")
#d[,column] = (d[,column]-mean(d[,column]))/(sd(d[,column]))

for(i in seq(3, dim(sum_data)[2]))
{
  sum_data[,i] = (sum_data[,i]-mean(sum_data[,i]))/sd(sum_data[,i])
}












# new random generator 
h = read.csv("health_data_orrisa.csv")

hnew = data.frame(
  dates = c();
)




for(i in seq(1, dim(h)[1]))
{
  
}