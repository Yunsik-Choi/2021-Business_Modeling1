install.packages("foreign")
library(foreign)

raw_welfare <- read.spss(file = "C:/R/Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

welfare <- raw_welfare

View(welfare)

library(dplyr)

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  code_job = h10_eco9,
                  income = p1002_8aq1,
                  code_region = h10_reg7)

welfare$sex
welfare$income

class(welfare$sex)
class(welfare$income)
table(welfare$sex)

welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
table(welfare$sex)
table(is.na(welfare$sex))

library(ggplot2)

welfare$sex <- ifelse(welfare$sex ==1, "male", "female")

qplot(welfare$sex)

ggplot(data=welfare, aes(x=sex)) + geom_bar()

class(welfare$income)

table(welfare$income)

summary(welfare$income)

qplot(welfare$income)
qplot(welfare$income) + xlim(0,1000)

welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)

summary(welfare$income)
table(is.na(welfare$income))


#성별에 따른 월급 평균의 차이
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()

#나이와 월급의 관계
class(welfare$birth)

summary(welfare$birth)

table(is.na(welfare$birth))

welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)

welfare$age <- 2015 - welfare$birth + 1

summary(welfare$age)
qplot(welfare$age)

birth_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

ggplot(data = birth_income, aes(x = age, y = mean_income)) + geom_line()
