library(ggplot2)
#ggplot2 라이브러리 설치 필요

#1
Midwest <- as.data.frame(ggplot2::midwest)
View(Midwest)
head(Midwest)
tail(Midwest)
dim(Midwest)
summary(Midwest)


library(dplyr)
#dplyr라이브러리 설치 필요

#2
Midwest_2 <- rename(Midwest, total=poptotal,asian=popasian)
View(Midwest_2)

#3
#문제에 어떠한 변수명으로 파생변수를 만들라는 언급이 없어서 '전체 인구 대비 아시아 인구 백분율'로 변수명을 만들었다.
Midwest_3 <- Midwest_2
Midwest_3$"전체 인구 대비 아시아 인구 백분율" <- (Midwest_3$asian/Midwest_3$total)*100
View(Midwest_3)
hist(Midwest_3$"전체 인구 대비 아시아 인구 백분율")

#4
#'avg_percasian'이라는이름으로 파생변수명을 만들었다.
Midwest_4 <- Midwest_3
Midwest_4$avg_percasian <- ifelse(Midwest_4$percasian>mean(Midwest_4$percasian),"large","small")
View(Midwest_4)

#5
table(Midwest_4$avg_percasian)
qplot(Midwest_4$avg_percasian)