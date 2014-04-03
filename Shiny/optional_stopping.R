library(ggplot2)
library(reshape)
library(zoo)

partialsum <- function(x) rollapply(x,width=length(x),partial=TRUE,align="right",FUN=sum)
partialmean <- function(x) rollapply(x,width=length(x),partial=TRUE,align="right",FUN=mean)
# be VERY careful with this method -- depending on how the partial sums are
# calculated, it can show a profound lack of numerical stability
partialsum.to.mean <- function(x){
  y <- c()
  for(i in 1:length(x)){
    y <- c(y,x[i] / i)
  }
  y
}

simulate <- function(alpha=0.05,n=10,increment=10,maxiter=10000,...){
  require(ggplot2)
  require(reshape)
  
  a <- rnorm(n)
  b <- rnorm(n)
  p <- rep("NA",n)
  
  count <- n
  for(i in 1:maxiter){
    t <- t.test(a,b)
    p <- c(p,t$p.value)
    
    if(t$p.value <= alpha){
      break
    }
    
    count <- count + increment
    nexta <- rnorm(increment)
    nextb <- rnorm(increment)
    a <- c(a,nexta)
    b <- c(b,nextb)
  }
  
  df <-  data.frame(a,b)
  df$idx <- as.numeric(row.names(df))
  
  du <-  data.frame(a=partialmean(a),b=partialmean(b))
  du$idx <- as.numeric(row.names(du))
  
  pvals <- data.frame(p)
  pvals$idx <- as.numeric(row.names(pvals))
  
  d <- melt(d,measure.vars=c("a","b"),variable_name="group")
  du <- melt(du,measure.vars=c("a","b"),variable_name="group")
  
  trans <- ifelse(count <= 10, 1,1/log10(count))
  
  list(count=count,
       ,samples=df
       ,means=du
       ,samples.plot=ggplot(data=d,aes(x=idx,y=value,color=group)) + geom_point(alpha=I(trans)) + geom_line(data=du,size=2)
       ,pvals=pvals,
       ,pvals.plot=ggplot(data=pvals,aes(x=idx,y=p)) + geom_line() +  geom_abline(intercept=alpha, slope=0, color="red",alpha=I(1/2))
       )
}

test <- simulate() 


