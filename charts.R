
#파이차트
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")
pie(x,labels)

#바차트
barplot(c(7,12,28,3,41))

#히스토그램
hist(c(9,13,21,8,36,22,12,41,31,33,19),xlab = "Weight",col = "yellow",border = "blue")

#라인차트
plot(c(7,12,28,3,41),type = "o")

#산포도차트
input <- mtcars[,c('wt','mpg')]
print(input)
plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)
#주식차트
input <- mtcars[,c('mpg','cyl')]
print(head(input))
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")


df_win_count<-dbGetQuery(conn, 
                         " SELECT 
                         A.WINNER,
                         COUNT(A.WINNER) WIN_COUNT
                         FROM(SELECT
                         K.SCHE_DATE 경기날짜,
                         CASE
                         WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
                         WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
                         ELSE '무승부'
                         END WINNER
                         FROM SCHEDULE K
                         JOIN TEAM HT
                         ON K.HOMETEAM_ID LIKE HT.TEAM_ID
                         JOIN TEAM AT
                         ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
                         WHERE
                         K.GUBUN LIKE 'Y'
                         AND K.SCHE_DATE LIKE '2012%'
                         )A
                         WHERE A.WINNER NOT LIKE '무승부'
                         GROUP BY A.WINNER
                         ORDER BY WIN_COUNT DESC"
                         
)
df_win_count



barplot(df_win_count[,2],names.arg=df_win_count[,1])

df_seat_count<-dbGetQuery(conn, 
                          "SELECT ROWNUM, A.*
                          FROM (  SELECT S.STADIUM_NAME, S.SEAT_COUNT
                          FROM STADIUM S
                          ORDER BY S.SEAT_COUNT DESC) A")
df_seat_count

pie(df_seat_count[,3],df_seat_count[,2],df_seat_count[,3])
pie(df_seat_count[,3], paste(substr(df_seat_count[,2],1,2),df_seat_count[,3]))

df_score_count<-dbGetQuery(conn,
                           " SELECT A.*
                           FROM(SELECT
                           K.SCHE_DATE Data,
                           HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME game,
                           CASE
                           WHEN K.HOME_SCORE >= K.AWAY_SCORE THEN (K.HOME_SCORE - K.AWAY_SCORE)
                           ELSE K.AWAY_SCORE - K.HOME_SCORE
                           END 점수차
                           FROM
                           SCHEDULE K
                           JOIN TEAM HT
                           ON K.HOMETEAM_ID LIKE HT.TEAM_ID
                           JOIN TEAM AT
                           ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
                           WHERE
                           K.SCHE_DATE LIKE '2012%'
                           AND K.GUBUN LIKE 'Y'
                           
                           ORDER BY 점수차 DESC) A"
                           
)
df_score_count

#히스토그램
x<-df_score_count[,3]
labels<-df_score_count[,1]
hist(x,labels = df_score_count[,2], col = "yellow",border = "blue")



df_score_month<-dbGetQuery(conn,
                           "SELECT (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201201%')
                           JEN,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201202%')
                           FEB,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201203%')
                           MAR,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201204%')
                           API,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201205%')
                           MAY,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201206%')
                           JUN,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201207%')
                           JUL,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201208%')
                           AUG,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '201209%')
                           SEP,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '2012010%')
                           OCT,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '2012011%')
                           NOV,
                           (SELECT COUNT (*)
                           FROM SCHEDULE
                           WHERE SCHE_DATE LIKE '2012012%')
                           DEC
                           FROM DUAL"
                           
                           )
df_score_month


plot(type = "o")
input <- COUNT[,c('MONTH', 'COUNT')]
plot(x = df_score_month[1,],
     y = df_score_month[2,],
     xlab = 'MONTH',
     ylab = 'COUNT',
     xlim = c(1,12),
     ylim = c(0,40),		 
     main = 'MONTH COUNT',
     axes=FALSE)

axis(1, at=1:12,lab=df_score_month[2,])
axis(2, at=5*0:30)


df_avg_height<-dbGetQuery(conn,
                          "select
                          (select tb.team_name
                          from team tb
                          where tb.team_id like t.team_id) teamName,
                          round(avg(p.height),2) avgtall 
                          from player p
                          join team t
                          on p.team_id like t.team_id
                          group by t.team_id
                          "
                          
                          )
x<-df_avg_height[,2]
labels<-df_avg_height[,1]
plot(x,type = "o",
     xlab = '이름',
     ylab = '평균키',
     xlim = c(1,15),
     ylim = c(160,190) ,
     main = 'avg_height',
     axes=FALSE)

axis(1, at=1:15,lab=df_avg_height[,1])
axis(2, at=5*0:200)



  



# SQL30 바차트 : 구단승리순으로 순위매기기
query = "SELECT A.WINNER,
COUNT(A.WINNER) WIN_COUNT
FROM(SELECT
K.SCHE_DATE 경기날짜,
CASE
WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
ELSE '무승부'
END WINNER
FROM SCHEDULE K
JOIN TEAM HT
ON K.HOMETEAM_ID LIKE HT.TEAM_ID
JOIN TEAM AT
ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE
K.GUBUN LIKE 'Y'
AND K.SCHE_DATE LIKE '2012%'
)A
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY WIN_COUNT DESC"
rs <- dbGetQuery(conn, query)
barplot(rs[,2],names.arg=rs[,1], main = "승리수")

