library(ggplot2)
library(dplyr)

midwest <- data.frame(ggplot2::midwest)
View(midwest)

#1
midwest1 <- midwest
midwest1$rateminor <- (midwest1$poptotal-midwest1$popadults)/midwest1$poptotal*100
View(midwest1)

#2
midwest2 <- midwest1
midwest2 <- head(midwest2 %>% arrange(desc(midwest2$rateminor)),n=5)
midwest2 %>% select(county, rateminor)

#3
midwest3 <- midwest1
midwest3$minorrating <- if_else(midwest3$rateminor>=40,"large",if_else(midwest3$rateminor>=30,"middle","small"))
table(midwest3$minorrating)
#large 32개  middle 396개  small 9개

#1
midwest4 <- midwest
midwest4$rateasian <- midwest4$popasian/midwest4$poptotal*100
midwest4 <- head(midwest4 %>% arrange(midwest4$rateasian),n = 10)
midwest4 %>% select(state,county,rateasian)
