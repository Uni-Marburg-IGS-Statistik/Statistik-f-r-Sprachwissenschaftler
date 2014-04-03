library(ggplot2)
library(scales)
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

simulate <- function(alpha=0.05,n=10,increment=1,maxiter=3000,...){
  require(ggplot2)
  require(scales)
  require(reshape)
  
  a <- rnorm(n)
  b <- rnorm(n)
  p <- c()
  
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
  
  if(tail(p,n=1) > alpha){
    # failure to converge
    stop(paste("Failed to achieve significance in",maxiter,"iterations."))
    return
  }
  
  df <-  data.frame(a,b)
  df$idx <- as.numeric(row.names(df))
  
  du <-  data.frame(a=partialmean(a),b=partialmean(b))
  du$idx <- as.numeric(row.names(du))
  
  pvals <- data.frame(p)
  pvals$idx <- as.numeric(row.names(pvals))
  
  df <- melt(df,measure.vars=c("a","b"),variable_name="group")
  du <- melt(du,measure.vars=c("a","b"),variable_name="group")
  
  trans <- ifelse(count <= 10, 1,1/log10(count))
  
  list(count=count
       ,samples=df
       ,means=du
       ,samples.plot=ggplot(data=df,aes(x=idx,y=value,color=group),size=1.5) + 
                     geom_point(alpha=I(trans)) + 
                     geom_line(data=du,size=2) +
                     scale_y_continuous(breaks= pretty_breaks())
       ,pvals=pvals
       ,pvals.plot=ggplot(data=subset(pvals,!is.na(p)),aes(x=idx,y=p)) + 
                   geom_line() + 
                   geom_abline(intercept=alpha, slope=0, color="red",alpha=I(1/2)) +
                   scale_y_continuous(breaks= pretty_breaks())
       )
}

test <- simulate() 
print(test$count)
print(test$samples.plot)
print(test$pvals.plot)

