#R에는 연속변수와 범주변수(factor)가 있다.
#연속변수는 키,거리 등... 범주변수는 남자,여자 등...
#numeric은 실수이다.

#numeric
x1 <- c(1,2,3,3,2)

#factor
x2 <- factor(c(1,2,3,3,2))


#변수 타입 확인 class(변수)
class(x1)
class(x2)

#변수 타입 변환 as.type(변수)
x2 <- as.numeric(x2)
x2
mean(x2)

#복소수도 계산 가능
xi <- 1+2i
yi <- 3+3i
xi+yi

#Data Frame
english <- c(90, 80, 85, 70, 60)
english
math <- c(70, 60, 85, 50, 90)
math
class <- c(1,2,3,2,1)

df_exam <- data.frame(english,math,class)
df_exam

#Data Frame 안에 변수를 특정할때 $를 사용한다.
mean(df_exam$math)

#한줄로 Data Frame 만들기
df_exam2 <- data.frame(english = c(90, 80, 85, 70, 60), math = c(90, 80, 85, 70, 60), class = c(1,2,3,2,1))

df_exam2

#excel파일 읽어들이기
#패키지 설치
install.packages("readxl")
#패키지 load
library(readxl)

def_exam3 <- read_excel('exam_score.xlsx')
