install.packages("dplyr")
library(dplyr)

## dplyr
# filter() 행추출
# select() 열추출
# arrange() 정렬
# mutate() 변수추가
# summarise() 통계치산출
# group_by() 집단별로 나누기
# left_join() 데이터합치기(열)
# bind_rows() 데이터합치기(행) v가 대문자

#working directory  지금 실행하고 있는 곳의 경로
path<-getwd()
path
setwd("CSV_exam")
df_exam <-read.csv("CSV_exam.csv", stringsAsFactors = F)

View(df_exam)
df_exam<-rename(df_exam,userid=id)

df_exam$avg<- (df_exam$math+df_exam$english+df_exam$science)/3

df_exam$grade <-ifelse(
  df_exam$avg>=90,"A",
  ifelse(df_exam$avg >=80, "B",
         ifelse(df_exam$avg >=70, "C",  
                ifelse(df_exam$avg >=60, "D",
                       ifelse(df_exam$avg >=50, "E","F"
         )))))


qplot(df_exam$grade)

rm(df_exam)
