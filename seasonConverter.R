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






Nephrology = c()
G.I.Surger = c()
Orthopaedic = c()
Cardiology = c()
Psychiatry = c()
Paediatric = c()
Chronic.Obstructive.Pulmonary.Disease = c()
Pneumonia = c()
emphysema = c()


j = 0
for(i in seq(1, dim(pd)[1]))
{
  r = which(as.character(pd$dates[i]) == as.character(h$dates))
  if(length(r)!=0)
  {
    Nephrology[i] = h$Nephrology[i]
    G.I.Surger[i] = h$G.I..Surgery[i]
    Orthopaedic[i] = h$Orthopaedic[i]
    Cardiology[i] = h$Cardiology[i]
    Psychiatry[i] = h$Psychiatry[i]
    Paediatric[i] = h$Paediatric[i]
    Chronic.Obstructive.Pulmonary.Disease[i] = h$Chronic.Obstructive.Pulmonary.Disease[i]
    Pneumonia[i] = h$Pneumonia[i]
    emphysema[i] = h$emphysema[i]
  }
}
  

merge_data_set= data.frame(
  "dates" = pd$dates,
  "so2"   = pd$so2,
  "no2"   = pd$no2,
  "pm10"  = pd$pm10,
  "pm2.5" = pd$pm2.5,
  "dates" = pd$dates,                        
  "Nephrology" =Nephrology ,                          
  "G.I..Surgery"=G.I.Surger     ,                    
  "Orthopaedic" = Orthopaedic  ,                       
  "Cardiology"  = Cardiology  ,                       
  "Psychiatry"  = Psychiatry ,                        
  "Paediatric"  = Paediatric,                         
  "Chronic.Obstructive.Pulmonary.Disease" = Chronic.Obstructive.Pulmonary.Disease,
  "Pneumonia" = Pneumonia,                            
  "emphysema" = emphysema
)


write.csv(merge_data_set, "merged_data_set.csv")
