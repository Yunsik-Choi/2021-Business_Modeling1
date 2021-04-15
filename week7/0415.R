housing.df <- read.csv("C:/R/WestRoxbury.csv")
library(dplyr)

df <- data.frame(sex = c("M","F","F",NA,"M"),
                 score = c(5,4,3,5,NA))
#결측치 처리
df$score <- ifelse(is.na(df$score), 4.25, df$score)
df$score

outlier <- data.frame(sex = c(1,2,1,3,2,1), score = c(5,4,3,4,2,6))

table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
table(outlier$sex)

table(is.na(outlier$sex))
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier$score

outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(avg_score = mean(score))

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
View(mpg)

boxplot(mpg$hwy)

boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy > 37 | mpg$hwy <12, NA, mpg$hwy)

table(is.na(mpg$hwy))

mpg %>%
  group_by(drv) %>%
  summarise(avg_hwy = mean(hwy, na.rm = T))


#visualization

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

#산점도 Scatter plot


