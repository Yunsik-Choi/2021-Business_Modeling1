housing.df <- read.csv("C:/R/WestRoxbury.csv")

xtotal <- model.matrix(~ 0 + BEDROOMS + REMODEL, data = housing.df)
xtotal

xtotal <- as.data.frame(xtotal)
xtotal$BEDROOMS[1:5]
head(xtotal)

#4열 없애기
xtotal <- xtotal[,-4]
xtotal

housing.df <- cbind(housing.df[,-c(9,14)], xtotal)
head(housing.df)
dim(housing.df)

#결측치
rows.to.missing <- sample(row.names(housing.df), 10)
rows.to.missing

housing.df[rows.to.missing,]$BEDROOMS <- NA
summary(housing.df$BEDROOMS)

housing.df[rows.to.missing,]$BEDROOMS <- median(housing.df$BEDROOMS, na.rm = TRUE)



#R practice
df <- data.frame(sex = c("M","F","F",NA,"M"),
                 score = c(5,4,3,5,NA))
df

#if na == True / na != False
is.na(df)

table(is.na(df))
table(is.na(df$sex))

library(dplyr)

df %>% filter(!is.na(score))

df_noNA <- df %>% filter(!is.na(score))
df_noNA
mean(df_noNA$score)

df_noNA <- df %>% filter(!is.na(score) & !is.na(sex))
df_noNA

#결측치가 하나라도 있으면 없앤다
df_noNA2 <- na.omit(df)
df_noNA2
