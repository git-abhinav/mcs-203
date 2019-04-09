d = read.csv("pollution.csv")
head(d)
ggplot(d, aes(x=Type.of.Location))+geom_bar()
# geom is for barchart, aes - aesthatics 

attributesName = c("SO2",	"NO2", "RSPM.PM10", "PM.2.5")

# Indexes 
# 1 SO2
# 2 NO2
# 3 RSPM.PM10
# 4 PM2.5

rowsWithIndustrialPollution = which(d$Type.of.Location == "Industrial Area")
#rowsWithRuralPollution = which(d$Type.of.Location == "Rural and other Areas Residential")
rowsWithRuralPollution = 1:dim(d)[1]



rowsWithRuralPollution = rowsWithRuralPollution[-rowsWithIndustrialPollution]

IndustrialMean = c()
RuralMean = c()

for(i in 1:4)
{
  IndustrialMean[i] = mean(d[rowsWithIndustrialPollution, attributesName[i]])
  RuralMean[i] = mean(d[rowsWithRuralPollution,attributesName[i]])

}
rural = data.frame(
  names = attributesName,
  means = RuralMean
)
industrial = data.frame(
  names = attributesName,
  means = IndustrialMean
)





toShowDataFrame = data.frame(
  industrial = ,
  rural = 
)

y1 = rural$means
y2 = industrial$means
id = attributesName
df1 <- data.frame(y1,y2,id)




ggplot(rural, aes(x=rural$names, y=rural$means)) + geom_bar(stat = "identity")


no2 = data.frame(
  names = c("rural", "industrail"),
  means = c(rural$means[1], industrial$means[1])
)
so2 = data.frame(
  names = c("rural", "industrial"),
  means = c(rural$means[2], industrial$means[2])
)

RSPM.PM10 = data.frame(
  names = c("rural", "industrial"),
  means = c(rural$means[3],  IndustrialMean[3])
)
PM2.5 = 

#ggplot(no2, aes=c(x=no2$names, y=no2$means))+geom_bar(stat = "identity")

ggplot(no2, aes(x=no2$names, y=no2$means)) + geom_bar(stat = "identity")
readline(prompt="Press [enter] to continue")
ggplot(so2, aes(x=so2$names, y=so2$means)) + geom_bar(stat = "identity")
readline(prompt="Press [enter] to continue")
ggplot(RSPM.PM10, aes(x=RSPM.PM10$names, y=RSPM.PM10$means)) + geom_bar(stat = "identity")






pm2.5 = d$PM.2.5
pm2.5 = pm2.5[-which(is.na(pm2.5))]
 