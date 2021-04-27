#line chart for the Amtrack data
Amtrak.df <- read.csv("C:\\R\\Amtrak.csv")
View(Amtrak.df)

#use time series analysis
install.packages("forecast")
library(forecast)
ridership.ts <- ts(Amtrak.df$Ridership, start=c(1991,1), end = c(2004,3), freq = 12)

plot(ridership.ts, xlab = "Year", ylab="Ridership (in 000s)", ylim = c(1300,2300))


#Boston Housing data
housing.df <- read.csv("C:\\R\\BostonHousing.csv")
View(housing.df)

#scatter plot 산점도
plot(housing.df$MEDV ~ housing.df$LSTAT, xlab = "MEDV", ylab = "LSTAT")

library(ggplot2)
#ggplot
ggplot(data = housing.df) + geom_point(aes(x = MEDV, y = LSTAT), colour = "navy", alpha = 0.7)

#barchart CHAS  vs mean MEDV
# compute mean MEDV per CHAS = (0,1)
#찰스강 인접한 집의 그룹 vs 찰스강 비인접 집의 그룹
data.for.plot <- aggregate(housing.df$MEDV, by = list(housing.df$CHAS),FUN = mean)
data.for.plot
names(data.for.plot) <- c("CHAS", "MeanMEDV")
data.for.plot
barplot(data.for.plot$MeanMEDV, names.arg = data.for.plot$CHAS, xlab = "CHAS", ylab = "Avg. MEDV")
ggplot(data.for.plot) + geom_bar(aes(x=CHAS,y=MeanMEDV),stat="identity")
