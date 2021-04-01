library(dplyr)

exam <- read.csv("C:/R/exam_score.csv")
exam

#filter(), select(), arrange(), mutate(), summarise(), group_by(), left_join(), bind_rows()

#subquery 적용
exam %>% filter(class %in% c(1,3,5))

#mutate() 파생변수를 추가한다
#mutate는 기존 데이터프레임에는 추가되지 않고 실행결과에만 보인다

#total 변수 추가
exam %>%
  mutate(total = english + math) %>%
  head

#total변수와 avg변수 추가
exam %>%
  mutate(total = english + math, avg = (english + math)/2)

#test변수 추가
exam %>%
  mutate(test = ifelse(math>=70, "pass","fail"))

#파생변수 생성 후 활용
exam %>%
  mutate(total = english + math) %>%
  arrange(desc(total))

#summarise() 행 요약
exam %>% summarise(english_mean = mean(math))


#group_by() group을 만들어준다
#각 반별 영어 평균 구하기
exam %>% group_by(class) %>%
  summarise(mean_english = mean(english))

exam %>% group_by(class) %>%
  summarise(mean_english = mean(english),
            sum_english = sum(english),
            median_english = median(english),
            n = n())

#aggregate functions : mean(): 평균 sd() : 표준편차 , sum(), median() : 중위값, min(), max, n() : 개수

library(ggplot2)
View(mpg)

mpg %>%
  group_by(manufacturer) %>%
  summarise(cty_mean = mean(cty)) %>%
  arrange(desc(cty_mean))

data1 <- data.frame(id = c(1,2,3,4,5), english = c(68, 89, 97, 94, 32))

data2 <- data.frame(id = c(1,2,3,4,5), math = c(63, 81, 90, 92, 42))

#left_join() 조건 record개수가 같고 변수가 다른 dataframe으로 쪼개져 있는 데이터를 옆으로 붙여준다 만약 by와 일치하는 아이디가 없으면 빈값이 들어간다

#공통적인 id로 합쳐준다
total_data <- left_join(data1,data2, by = "id")
total_data

data_a <- data.frame(id = c(1,2,3,4,5), english = c(68, 72, 81, 67, 87))

data_b <- data.frame(id = c(6,7,8,9,10), english=c(54, 75, 83, 75, 77))

#bind_rows 열의 개수가 같고 다른 dataframe으로 쪼개져 있는 데이터를 아래로 붙여준다.
total_data2 <- bind_rows(data_a, data_b)
total_data2

#random하게 smpling해줌
s <- sample(row.names(exam),5)
s

#5개의 record가 random sampling됨
exam[s,]





