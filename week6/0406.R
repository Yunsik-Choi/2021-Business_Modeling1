housing.df <- read.csv("C:/R/WestRoxbury.csv")

s <- sample(row.names(housing.df),5)
s

housing.df[s,]

#over sampling
s <- sample(row.names(housing.df), 5, prob = ifelse(housing.df$ROOMS>10,0.9,0.01))

housing.df[s,]

names(housing.df)

#행과 열 바꾸기
t(t(housing.df))

colnames(housing.df)[1]

#data type
class(housing.df$REMODEL)
class(housing.df[,14])

#level은 factor variable일때 가능
as.factor(housing.df$REMODEL)

class(housing.df$BEDROOMS)