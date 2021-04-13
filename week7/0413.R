housing.df <- read.csv("C:/R/WestRoxbury.csv")

train.rows <- sample(rownames(housing.df), dim(housing.df)[1]*0.6)
train.rows
train.data <- housing.df[train.rows,]
head(train.data, n=15)

valid.rows <- setdiff(rownames(housing.df),train.rows)
valid.data <- housing.df[valid.rows,]
valid.data

train.rows <- sample(rownames(housing.df), dim(housing.df)[1]*0.5)
valid.rows <- sample(setdiff(rownames(housing.df),train.rows),dim(housing.df)[1]*0.3)
test.rows <- setdiff(rownames(housing.df),union(train.rows, valid.rows))
train.data <- housing.df[train.rows,]
valid.data <- housing.df[valid.rows,]
test.data <- housing.df[test.rows,]

reg <- lm(TOTAL.VALUE ~ . -TAX, data = housing.df, subset = train.rows)
tr.res <- data.frame(train.data$TOTAL.VALUE, reg$fitted.values, reg$residuals)
head(tr.res)

pred <- predict(reg, newdata = valid.data)
vl.res <- data.frame(valid.data$TOTAL.VALUE, pred, residuals = valid.data$TOTAL.VALUE - pred)


