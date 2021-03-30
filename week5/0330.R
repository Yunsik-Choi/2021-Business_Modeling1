housing.df <- read.csv("C:/R/westRoxbury.csv",header=TRUE)
dim(housing.df)

#1~10까지 1열 데이터 보기
housing.df[1:10,1]
housing.df$TOTAL.VALUE[1:10]

#1~10까지 전체열 데이터 보기
housing.df[1:10,]

#1~5열까지 1,2,4,8,9,10열 데이터 보기
housing.df[5,c(1:2,4,8:10)]

#값이 몇개인지
length(housing.df$TOTAL.VALUE)
#total average
mean(housing.df$TOTAL.VALUE)
#summary
summary(housing.df)

#dplyr pkg
library(dplyr)

exam <- read.csv("C:/R/exam_score.csv")
exam

#filter(), select(), arrange(), mutate(), summarise(), group_by(), left_join(), bind_rows()

#filter() 특정 조건을 만족하는 데이터를 보는 함수
#class가 1인 데이터만 보기
exam %>% filter(class==1)

#select() 어떤 변수만 보고싶을때
#english와 class 보기
exam %>% select(english,class)
#class만 빼고 보기
exam %>% select(-class)

# %>% 체이닝 가능
exam %>%
  filter(class==1) %>%
  select(math,english)


#arrange() 정렬
exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(math,english)