
install.packages("ggplot2")
library(ggplot2)


read.csv(file = "C:\\Users\\1027\\Rworkspace\\2013년_전년대비_시간대별_교통사고_사망자_현황 (1).csv")

## sample
x<-c("2","2","3","1","4","4","4","4")
x
qplot(x)
rm(x)  ##remove

# manufacturer
# model
# model name
# 
# displ
# engine displacement, in litres
# 
# year
# year of manufacture
# 
# cyl
# number of cylinders
# 
# trans
# type of transmission
# 
# drv
# f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# 
# cty
# city miles per gallon
# 
# hwy
# highway miles per gallon
# 
# fl
# fuel type
# 
# class
# "type" of car


#######  mpg 데이터 파악하기
## 내가 모르는 빅데이터를 분석하는 방법

#data= mpg, x축에 변수 지정해 그래프 설정
qplot(data = mpg,x =hwy)
# x축 ciy
qplot(data = mpg,x =cty)


#mpg 데이터를 데이터 프레임으로 만든다
mpg<- as.data.frame(ggplot2::mpg)
head(mpg) ##상위 6개를 보여줌
tail(mpg) ## 하위 6개를 보여줌
dim(mpg) ## 234 행 11열 구조이다
str(mpg) ##11개의 변수와 각 타입을 보여준다
summary(mpg)
#통합 연비 변수 생성
mpg$total <-(mpg$cty+mpg$hwy) /2
head(mpg)
#통합 연비 변수 평균
mean(mpg$total)
#요약 통계량 산출
summary(mpg$total)
hist(mpg$total)
#total 연비의 평균과 중앙값이 약 20이다
#total 연비가 20-25 사이에 해당하는 자동차 모델이 가장 많다
#대부분 25이하고, 25를 넘기는 자동차는 많지 않다

##합격 판정 변수 만들기
#total이 20 이상이면 pass, 미만이면 fail을 
#부여하는 test 라는 변수를 생성합니다
mpg$test <-ifelse(mpg$total>=20, "pass", "fail")
head(mpg, 20)
#합격판정을 자동차 수  살펴보자
table(mpg$test)
qplot(mpg$test)
#total 30 이상이면 A
#total 29-29면 B
#total 20미만 C
mpg$grade <-ifelse(
  mpg$total>=30,"A",
  ifelse(mpg$total >=20, "B","C")
)
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)

mpg$grade <-ifelse(
  mpg$total>=30,"A",
  ifelse(mpg$total >=20, "B",
         ifelse(mpg$total >=10, "c","D"   )))


#변수명 변경
mpg<- rename(mpg,company=manufacture)



# ggplot2 패키지에는 미국 동북중부 437개 지역의 
# 인구통계 정보를 담은 midwest 라는 데이터가 
# 들어 있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오
# 1.  populator 변수를 total 로, popasian 변수를 
# asian 으로 수정하세요
midwest$total <-midwest$poptotal
midwest$asian <-midwest$popasian


# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 
# 백분율' 파생변수를만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보시오.
midwest<- as.data.frame(ggplot2::midwest)
head(midwest)
midwest$asian_per<- (midwest$asian/midwest$total)*100
hist(midwest$asian_per,xlab = "??",col = "yellow",border = "blue")

qplot(midwest$asian_per)

summary(midwest)
str(midwest$asian)
rm(midwest)
# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large' , 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
midwest$asian_p<-mean(midwest$asian_avg)
head(midwest$asian_p)




midwest$grade <-ifelse(midwest$asian_p>midwest$asian_avg, "large","small")
table(midwest$grade )
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.



qplot(midwest$grade)
