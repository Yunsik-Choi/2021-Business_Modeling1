library(foreign)
raw_welfare <- read.spss(file = "C:/R/Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
View(raw_welfare)


welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  code_job = h10_eco9,
                  income = p1002_8aq1,
                  code_region = h10_reg7)

library(dplyr)
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle","old")))

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col() + scale_x_discrete(limits = c("young","middle","old"))


# 연령대 및 성별 월급차이
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

ggplot(data = sex_income, aes(x=ageg, y=mean_income, fill = sex)) + geom_col(position = "dodge") + scale_x_discrete(limits = c("young","middle","old"))


# 5. 나이별 성별 월급차이/추세 (line graph)

sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age,sex) %>%
  summarise(mean_income = mean(income))

ggplot(data = sex_age, aes(x=age, y= mean_income, col = sex)) + geom_line()

# 6. 직업별 월급차이
class(welfare$code_job)

library(readxl)
list_job <- read_excel("C:/R/Koweps_Codebook.xlsx", col_names = T, sheet = 2)

dim(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")


welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job,job) %>%
  head(10)

View(welfare)

dim(welfare)
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

ggplot(data = top10, aes(x= reorder(job,-mean_income), y= mean_income)) + geom_col() + coord_flip()

#성별 직업 빈도
job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_male

job_female <- welfare %>%
  filter(!is.na(job) & sex == "female") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_female

ggplot(data = job_female, aes(x = job, y=n)) + geom_col() + coord_flip()

