# switch

rpsg<-function(my){
  com<-sample(1:3,1,replace=TRUE)
  return(switch(
    toString(my-com),
    '-1'="승리",
    '2'="승리",
    '1'="패배",
    '-2'="패배",
    '0'="무승부",
    "ERROR"))
}
rpsg(1)

