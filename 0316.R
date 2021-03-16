a <- 5
b <- 3
a*b

c <- "윤식"
c

#Array
d <- c(1,2,3,4)
d
d <- c(1:4)
d

e <- c("안녕","R")
e

# 1~5까지 
f <- seq(1,10)
f

g <- seq(1,10, by = 2)
g

#평균
mean(g)
max(g)
min(g)

#나열된 원소를 collapse로 나누어 구분하여 출력
paste(e, collapse=" ")

#package설치
install.packages("ggplot2")
#패키지 load
library(ggplot2)

h <- c("m","m","f","m","f","m","m")
h

#빈도 막대 그래프 그리기
qplot(h)


qplot(data= mpg, x = drv, y = hwy, geom = "boxplot")