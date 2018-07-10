

calc<-function(input1, input2,op){
  return(switch(op,
                '+' = input1+input2,
                '-' = input1-input2,
                '*' = input1*input2,
                '%%' = input1%%input2,
                '%/%' = input1%/%input2,
                '/' = input1/input2))
}

calc(5,2,'-')


