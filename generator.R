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

 
