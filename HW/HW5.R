#1번
#(1) Bar Chart는 그룹별로 비교하는데 유용하다.
#(2) Line Graph는 시계열을 보는데 유용하다 
#(3) Scatter Plot은 군집같은 데이터들간의 연관성을 밝히는데 유용하다
#(4) Histogram 빈도를 확인할 때 유용하고 Barchart는 Categorical변수에 사용되지만 Histogram은 numeric value에 사용된다.
#(5) Box Plot numeric 변수의 잠재성을 평가할때 유용하다

library(ggplot2)
library(forecast)

#2 
appship.df <- read.csv("C://R/hw/ApplianceShipments.csv")

appship.ts <- ts(appship.df$Shipments,
                 start = c(1985,1),
                 end = c(1989,4),
                 freq = 4)


plot(appship.ts, xlab = "Year", ylab = "Shipments (in million dollars)", ylim = c(3500,5000))

ggplot(data = mpg, aes(x=cty, y=hwy)) + geom_point(colour = "navy")


ggplot(data = midwest, aes(x=poptotal,y=popasian)) + geom_point() + xlim(0,500000) + ylim(0,10000)


mpg <- as.data.frame(ggplot2::mpg)
View(mpg)
library(dplyr)

mpg %>%
  filter(class=="suv") %>%
  group_by(manufacturer) %>%
  summarise(avg_cty = mean(cty)) %>%
  arrange(desc(avg_cty)) %>%
  head(5)

ggplot(data = mpg, aes(x= class)) + geom_bar()
