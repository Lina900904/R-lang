a+b
a^b
a%%b
a/b
a-b
a
a <- c(1,2,3,4)
a <- c(1,"2",3,"4")
a <- c("a", "b", "c", "d")
sample(1:3,1,replace=TRUE) #Random

#rock 1 scissor 2 paper 3
user<-1
com<-sample(1:3,1,replace=TRUE)
result <- user-com
if(result== -1 || result== 2) print("Win")  else 
  if(result== 1 || result== -2) print ("Lose") else print("Draw")

# switch
com<-sample(1:3,1,replace=TRUE)
my<-1
cat('컴퓨터 :',com)
res<-toString(my-com)
cat('결과 :',res)
x <- switch(
  res,
  '-1'="승리",
  '2'="승리",
  '1'="패배",
  '-2'="패배",
  '0'="무승부",
  "ERROR"
) 
print(x)

# switch
my<-1
print(switch(
  toString(my-sample(1:3,1,replace=TRUE)),
  '-1'="WIN",
  '2'="WIN",
  '1'="LOSE",
  '-2'="LOSE",
  '0'="DRAW"
))


# BMI
height = sample(100:200,1,replace=TRUE)
weight = sample(50:100,1,replace=TRUE)
bmi = weight/(((height)^2)/10000)
height
weight
bmi
if (bmi>=35) print("3단계 비만") else
  if (bmi>=30) print("2단계 비만") else
    if (bmi>=25) print("1단계 비만") else
      if (bmi>=23) print("비만 전단계") else
        if (bmi>=18.5)print("정상") else  print("저체중")

# 다양한 값 배정
print(c(1:10))
print(seq(from=1,to=10,by=2))
print(seq(from=1,length=10,by=2))
print(seq(1,10,2))
print(1:5)
print(1:5,each=2)
print(rep(1:5,times=2))
print(rep(1:5,each=2,times=3))
print(rep(1:5,times=3,each=2,len=15))
print(rep(1:5,each=2,times=3,len=15))

# 계산기
input1 = 10
input2 = 3
opcode = '%%'
res <- switch(opcode,
              '+' = input1+input2,
              '-' = input1-input2,
              '*' = input1*input2,
              '%%' = input1%%input2,
              '%/%' = input1%/%input2,
              '/' = input1/input2
)
cat(input1,opcode,input2,'=',res)







# 1부터 5까지의 합(length 사용)
for(i in(1:5)){
  if(i==length(x)){
    cat(i,'=',sum(x))
  } else{
    cat(i,'+')
  }
}

# 1부터 5까지의 합(length 사용x)
for(i in(1:5)){
  if(i==5)
    cat(i,'=',sum(1:5))
  else
    cat(i,'+')
}

# 1-2+3-4...... -100 = -50 if문 사용
sum<-0
for(i in(1:100)){
  if(i==100)
    cat(i,"=",sum(seq(1,100,2))+sum(seq(-2,-100,-2)))
  else if (i%%2==1)
    cat(i,"-") else 
      cat(i,"+")
}

# 1-2+3-4...... -100 = -50 switch문 사용
sum<-0
for(i in(1:100)){
  if(i==100)
    cat(i,"=",sum(seq(1,100,2))+sum(seq(-2,-100,-2))) 
  else
    switch(
      toString(i %% 2),
      '0'=cat(i,'+'),
      '1'=cat(i,'-')
    )
}














help("=")