
M <- matrix(c(1:25), nrow=5, byrow=TRUE)
print(M)

N <- matrix(c(1:25), nrow=5, byrow = FALSE)
print(N)


x<-c(1,2)
cat(x)
x<-append(x,3)
cat(x)

n<-1
for(i in 1:8)
{
  n<-n*2
}
cat(n)

x=c()
x[1]=1
cat(x)
for(i in 2:5){
  x[i]=i
}
cat(x)

x<-c(1,2,3,4,5)
y<-c(10,9,8,7,6)
z<-append(x,y)
cat(z)

##삼각형

