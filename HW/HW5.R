#1번
#(1) Bar Chart는 그룹별로 비교하는데 유용하다.
#(2) Line Graph는 시계열을 보는데 유용하다 
#(3) Scatter Plot은 군집같은 데이터들간의 연관성을 밝히는데 유용하다
#(4) Histogram 빈도를 확인할 때 유용하고 Barchart는 Categorical변수에 사용되지만 Histogram은 numeric value에 사용된다.
#(5) Box Plot numeric 변수의 잠재성을 평가할때 유용하다

#2 
ship <- read.csv("ApplianceShipments.csv")
library(forecast)

#2-1
ship.ts <- ts(ship$Shipments, start = c(1985,1), end = c(1989,4))
plot(ship.ts, xlab = "Year", ylab ="Shipments")
#2-2
plot(ship.ts, xlab = "Year", ylab ="Shipments", ylim = c(3500,5000))
#2-3
#1986년도까지 상승하다 하락하여 1988년도에 최저점을 찍고 이후 1991년까지 상승하다 다시 하락하였다.

#3
library(ggplot2)
#3-1
mpg <- as.data.frame(ggplot2::mpg)
ggplot(data = mpg, aes(x=cty,y=hwy)) + geom_point(col="navy")

#3-2
midwest <- as.data.frame(ggplot2::midwest)
ggplot(data = midwest, aes(x=poptotal,y=popasian)) + geom_point() + coord_cartesian(xlim = c(0,500000), ylim = c(0,10000))

#3-3
mpg.cty <- mpg[mpg$class == "suv",]
data.for.plot <- aggregate(sort(mpg.cty$cty, decreasing = TRUE), by = list(mpg.cty$manufacturer), FUN = mean)
names(data.for.plot) <- c("manufacture","MeanCty")
ggplot(head(data.for.plot, n=5), aes(x=reorder(manufacture,-MeanCty), y=MeanCty)) + geom_bar(stat='identity')


#3-4
library(dplyr)
mpg.class <- mpg %>%
  group_by(class) %>%
  summarise(count = n())

ggplot(mpg.class, aes(x=class,y=count)) + geom_bar(stat = 'identity')
