library(ggplot2)
#1
Midwest <- as.data.frame(ggplot2::midwest)
View(Midwest)
head(Midwest)
#상위 6개와 하위 6개를 알 수 있지만 state별 ABC순으로 나열되있으므로 의미가 있는 데이터는 아니다
dim(Midwest)
#행개수가 437개 있으므로 437개의 도시를 조사했음을 알 수 있고 열 개수가 28개 이므로 각 행은 28개의 속성을 가지고 있음을 알 수 있다.
summary(Midwest)
#summary를 통해 column을 분석해보면 
#우선 column은 지역ID,지역이름,소속 주,지역크기,각 인종의 수,각 인종의 백분율,성인인구 등 다양한 지역 정보를 포함하고 있음을 알 수 있다.
#country : length가 437이기 때문에 437개의 지역으로 이루어졌음을 알 수 있다.
#area : 가장 좁은 땅을 차지하는 지역은 동북중부의 0.005%를 차지하고 가장 넓은 땅을 차지하는 지역은 0.11%를 차지한다. 평균적으로는 각 지역은 0.03317%를 차지한다
#poptotal : 인종의 총 합으로 이를 통해 지역의 인구수를 파악 할 수 있다. 가장 인구가 적은 지역은 1701명이 살고 가장 많은 지역은 5105067명이 산다. 평균적으로는 96130명이 산다.
#popasian : 지역 중 asian이 가장 적은 지역은 0명의 asian이 살고 가장 많은 지역은 188565명이 산다. 평균적으로는 1310명이 각 지역에 산다.
#popadults : 각 지역에 사는 성인 인구로 가장 적은 수의 성인이 사는 지역은 1287명이 거주하고 가장 많은 성인이 사는 지역은 3291995명이 살고 평균적으로는 60973명의 성인이 거주한다.

library(dplyr)
#2
Midwest_2 <- rename(Midwest, total=poptotal,asian=popasian)
View(Midwest_2)

#3
Midwest_3 <- Midwest_2
Midwest_3$"전체 인구 대비 아시아 인구 백분율" <- (Midwest_3$asian/Midwest_3$total)*100
View(Midwest_3)
hist(Midwest_3$"전체 인구 대비 아시아 인구 백분율")
#전체 인구 대비 아시아 인구의 백분율은 300개 이상의 도시들이 0~0.5%에 속하였고 50개 이상의 도시들은 0.5~1%에 속하였다. 1%가 넘는 도시들도 있었지만 매우 전체 도시 수에 비해 매우 적은 도시만이 1%를 넘겼다.

#4
Midwest_4 <- Midwest_3
Midwest_4$avg_percasian <- ifelse(Midwest_4$percasian>mean(Midwest_4$percasian),"large","small")
View(Midwest_4)

#5
table(Midwest_4$avg_percasian)
qplot(Midwest_4$avg_percasian)
#아시아 인구 백분율 전체 평균을 초과하는 도시는 119개 그 외의 도시는 318개의 도시가있다.