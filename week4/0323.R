#excel파일 읽어들이기
#패키지 설치
install.packages("readxl")
#패키지 load
library(readxl)
df_exam3 <- read_excel('C:/R/exam_score.xlsx')
df_exam3
#보기 편하게
View(df_exam3)

#excel sheet 번호 지정하기
#df_exam3 <- read_excel('C:/exam_score.xlsx', sheet = 3)

df_exam4 <- read.csv('C:/exam.csv')
df_exam4

#head(), tail(), view(), dim(), str(), summary()
#상위 6개 출력
head(df_exam3)
#하위 6개 출력
tail(df_exam3)
#열개수 행개수
dim(df_exam3)
#데이터 속성,데이터 출력
str(df_exam3)
#유용한 정보들을 보여준다.
summary(df_exam3)
#1st Qu: 최솟값과 최댓값의 범위의 1사분위 끝값
#3st Qu: 최솟값과 최댓값의 범위의 3사분위 끝값

#ggplot2 패키지 mpg데이터(미국에 출시된 자동차의 연비정보)
install.packages("ggplot2")
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
View(mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)

mean(mpg$cty)

install.packages("dplyr")
library(dplyr)

#rename()
df_var <- data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
df_var

# 변수명 바꾸기
df_new <- rename(df_var, v2 = var2)
df_new

#sum 파생변수 만들기 (기존에 있던 값들로부터 나온 변수)
df_exam3
df_exam3$sum <- df_exam3$english + df_exam3$math
df_exam3$avg <- (df_exam3$english + df_exam3$math)/2
df_exam3

mpg_new <- mpg
View(mpg_new)
mpg_new$total <- (mpg_new$cty + mpg_new$hwy)/2
head(mpg_new)

summary(mpg_new$total)
#histogram
hist(mpg_new$total)
View(mpg_new)

#ifelse문
mpg_new$eval <- ifelse(mpg_new$total>=20,"pass","fail")
View(mpg_new)
#중첩 else문
mpg_new$grade <- ifelse(mpg_new$total>=30,"A",ifelse(mpg_new$total>=20,"B","C"))

#빈도표
table(mpg_new$eval)
#qplot() 빈도그래프(ggplot2라이브러리)
qplot(mpg_new$eval)