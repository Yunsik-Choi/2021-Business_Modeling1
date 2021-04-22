library(ggplot2)


#산점도
ggplot(data = mpg, aes(x=displ, y=hwy)) + geom_point()

library(dplyr)
#막대그래프 (bar graph)
mpg <- as.data.frame(ggplot2::mpg)
df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(avg_hwy = mean(hwy))

#작은순서부터 큰순서 부터면 -붙여서
ggplot(data = df_mpg, aes(x=reorder(drv,-avg_hwy), y = avg_hwy)) + geom_col()

#빈도막대그래프
ggplot(data = mpg, aes(x=drv)) + geom_bar()

economics <- as.data.frame(ggplot2::economics)

#line graph
ggplot(data = economics, aes(x= date, y=unemploy)) + geom_line()

#boxplot(상자그림)
#상자의 두께가 좁은지/넓은지
#수염이 짧은지
#중위값이 어디에 치우쳤는지
#극단치(이상치)가 많은지/적은지
ggplot(data = mpg, aes(x=drv,y=hwy))+geom_boxplot()






