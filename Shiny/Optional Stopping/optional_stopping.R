library(ggplot2)
library(reshape)
library(zoo)

alpha <- 0.05
n <- 10
increment <- 10
a <- rnorm(n)
b <- rnorm(n)

count <- n

while(TRUE){
  t <- t.test(a,b)
  
  if(t$p.value <= alpha){
    break
  }
  
  count <- count + increment
  a <- c(a,rnorm(increment))
  b <- c(b,rnorm(increment))
}

# sampling progression and mean to that point

sampling_progression <- function(a,b){
  d <- data.frame(a,b)
  d$idx = as.numeric(row.names(d))
  
  du <- data.frame(a = rollapply(a,width=length(a),partial=TRUE,align="right",FUN=mean)
                  ,b =  rollapply(b,width=length(b),partial=TRUE,align="right",FUN=mean)
      )
  du$idx = as.numeric(row.names(du))
  
  d <- melt(d,measure.vars=c("a","b"),variable_name="group")
  du <- melt(du,measure.vars=c("a","b"),variable_name="group")
  
  trans <- ifelse(count <= 10, 1,1/log10(count))
  
  ggplot(data=d,aes(x=idx,y=value,color=group)) + geom_point(alpha=I(trans)) + geom_line(data=du,size=2)
}

pvalue_progression <- function(a,b){
  p <- c()
  for(i in seq(n,count+1,increment)){
    p <- c(p,t.test(a[1:i],b[1:i])$p.value)
  }
  
  pvals <- data.frame(p)
  pvals$idx <- as.numeric(row.names(pvals))
  ggplot(data=pvals,aes(x=idx,y=p)) + geom_line() +  geom_abline(intercept=alpha, slope=0, color="red",alpha=I(1/2))
}

print(count)
print(sampling_progression(a,b))
print(pvalue_progression(a,b))


