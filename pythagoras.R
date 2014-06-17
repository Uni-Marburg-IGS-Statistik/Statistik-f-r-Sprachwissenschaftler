set.seed(42)
x1 <- runif(n=20,min=0,max=10)
x2 <- runif(n=20,min=0,max=20)
y <- sqrt(x1^2 + x2^2)

d <- data.frame(x1,x2,y)

write.table(d,file="Data/pyreg.tab",row.names=FALSE,col.names = TRUE)