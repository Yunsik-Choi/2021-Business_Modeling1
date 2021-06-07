library(dplyr)
library(ggplot2)
library(foreign)

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  code_job = h10_eco9,
                  income = p1002_8aq1,
                  code_region = h10_reg7)

class(welfare$religion)
table(welfare$religion)

welfare$religion <- ifelse(welfare$religion == 1, "yes","no")

qplot(welfare$religion)

class(welfare$marriage)

welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage", ifelse(welfare$marriage == 3, "divorce", NA))

table(welfare$group_marriage)
qplot(welfare$group_marriage)

religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion,group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group * 100,1))

religion_marriage

divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(religion,pct)

divorce

ggplot(data = divorce, aes(x=religion, y=pct)) + geom_col()


#연령대별 이혼율
head(welfare$ageg, 10)

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100,1))

ageg_marriage

ageg_divorce <- ageg_marriage %>%
  filter(ageg != "young" & group_marriage == 'divorce') %>%
  select(ageg,pct)

ageg_divorce

ggplot(data = ageg_divorce, aes(x=ageg,y=pct)) + geom_col()


#연령대별, 종교 유무에 따른 이혼율
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100,1))
ageg_religion_marriage

df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg,religion,pct)

df_divorce

ggplot(data = df_divorce, aes(x=ageg,y=pct, fill=religion)) + geom_col(position = "dodge")

#지역별 연령대 비율(노년층이 많은 지역은?)
class(welfare$code_region)
table(welfare$code_region)

list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))

list_region

welfare <- left_join(welfare, list_region, id="code_region")

welfare %>%
  select(code_region, region) %>%
  head(150)

region_ageg <- welfare %>%
  group_by(region,ageg) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group * 100, 1))
region_ageg

ggplot(data = region_ageg, aes(x=region,y=pct,fill=ageg)) + geom_col() + coord_flip()


list_order_old <- region_ageg %>%
  filter(ageg == "old") %>%
  arrange(pct)
list_order_old
order <- list_order_old$region
order

ggplot(data = region_ageg, aes(x=region, y=pct,fill=ageg)) + geom_col() + coord_flip() + scale_x_discrete(limits = order)

class(region_ageg$ageg)

region_ageg$ageg <- factor(region_ageg$ageg, level = c("old","middle","young"))

ggplot(data = region_ageg, aes(x=region, y=pct, fill=ageg)) + geom_col() + coord_flip() + scale_x_discrete(limits = order)
