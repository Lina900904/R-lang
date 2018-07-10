##Statments를 합치면 function이 된다
##4가지가 반드시 있어야 function이 된다 R.syntax

  grade<-function(name, kor,emg,math){
  x<-c(kor,eng,math)
  return(list(name= name,
              sum = sum(x),
              mean = mean(x),
              grade = switch(
                toString(mean(x)%/%10),
                '10' = 'A',
                '9' = 'B',
                '8' = 'C',
                '7' = 'D',
                '6' = 'E',
                '5' = 'F',
                '4' = 'G'
              )))
  }

  class(res$name)
  class(res$sum)
  class(res$mean)
  class(res$grade)
  
  
  


  
  a<-grade("강감찬",60,60,60)
  b<-grade("dsf",60,70,60)
  c<-grade("sdf",60,20,60)
  d<-grade("sf",90,90,99)
  e<-grade("sdf",90,60,60)
  
  grade.data <- data.frame(
    grade_id =c(1:5),
    name = c(a$name,b$name,c$name,d$name,e$name),
    sum = c(a$sum,b$sum,c$sum,d$sum,e$sum),
    avg = c(a$mean,b$mean,c$mean,d$mean,e$mean),
    grade = c(a$grade,b$grade,c$grade,d$grade,e$grade),
    stringsAsFactors = FALSE
  )
  print(grade.data)


#파이
x<-grade.data$avg
labels<-grade.data$name
pie(x,labels)

#바차트
barplot(df_stu$sum, names.arg=df_stu$name)


#히스토그램
x<-grade.data$avg
labels<-grade.data$name
hist(x,labels = grade.data$name,col = "yellow",border = "blue")

#라인차트
x<-grade.data$avg
labels<-grade.data$name
plot(x,type = "o")

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


