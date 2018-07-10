##Statments를 합치면 function이 된다
##4가지가 반드시 있어야 function이 된다 R.syntax

grade<-function(name, kor,emg,math){
x<-c(kor+eng+math)
  return(c(name,sum(x),mean((x)/3),
           switch(toString(mean((x)/3)%/%10),
                               '9'='A',
                               '8'='B',
                               '7'='C',
                               '6'='D',
                               '5'='E',
                               'F')))
}
res<-grade("강감찬",60,60,60)
cat(res)

cat("************************************\n")
cat("| 이름  |  총점   |  평균    | 등급  |\n")
cat("-------------------------------------\n")
cat("|",   res[1],  "|",   res[2] ,  "|",   res[3] , "|" , res[4], "|\n")
cat("************************************")
