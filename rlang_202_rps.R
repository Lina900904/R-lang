


bmi<-function(height,weight){
 bmi = weight/(((height)^2)/10000)

  return(c(height,weight,
    if (bmi>=35) "3단계 비만" else
    if (bmi>=30) "2단계 비만" else
      if (bmi>=25) "1단계 비만" else
        if (bmi>=23) "비만 전단계" else
          if (bmi>=18.5)"정상" else  
           "저체중"))
}


res <- bmi(160,50)
cat(res[1], res[2],res[3])






