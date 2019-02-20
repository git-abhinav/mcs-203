d = read.csv("pollution.csv")
head(d)
ggplot(d, aes(x=Type.of.Location))+geom_bar()
# geom is for barchart, aes - aesthatics 
