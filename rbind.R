rrr <- function(ssss){
  return ( 
    switch(
      toString(ssss),
      "1"=rbind(matrix(c(1,0,0,0),nrow=1, ncol=4, byrow=TRUE), 
                matrix(c(2,3,0,0), nrow=1,  ncol=4,byrow=TRUE), 
                matrix(c(4,5,6,0), nrow=1,  ncol=4,byrow=TRUE),
                matrix(c(7,8,9,10), nrow=1, ncol=4,byrow=TRUE)),
      "2"=rbind(matrix(c(1,2,3,4), nrow=1,  ncol=4,byrow=TRUE),
                matrix(c(8,7,6,5), nrow=1, ncol=4, byrow=TRUE), 
                matrix(c(9,10,11,12), nrow=1,  ncol=4,byrow=TRUE),
                matrix(c(16,15,14,13), nrow=1,ncol=4, byrow=TRUE)),
      "3"=rbind(matrix(c(0,0,1,0,0), nrow=1,ncol=5, byrow=TRUE),
                matrix(c(0,2,3,4,0), nrow=1, ncol=5,byrow=TRUE),
                matrix(c(5,6,7,8,9), nrow=1,ncol=5, byrow=TRUE),
                matrix(c(0,10,11,12,0), nrow=1,ncol=5, byrow=TRUE), 
                matrix(c(0,0,13,0,0), nrow=1,ncol=5, byrow=TRUE)) 
    ))
}
rrr(1)

