library(ggplot2)
library(gridExtra)
library(scales)
library(reshape)
library(zoo)

partialmean <- function(x) rollapply(x,width=length(x),partial=TRUE,align="right",FUN=mean)

simulate <- function(alpha=0.05,n=10,maxiter=3000,...){
  require(ggplot2)
  require(scales)
  require(reshape)
  
  increment <- 1
  a <- rnorm(n)
  b <- rnorm(n)
  p <- rep(NA,n-1)
  ua <- partialmean(a[1:n-1])
  ub <- partialmean(b[1:n-1])
  ci.min <- rep(NA,n-1)
  ci.max <- rep(NA,n-1)
  
  count <- n
  for(i in 1:maxiter){
    t <- t.test(a,b)
    p <- c(p,t$p.value)
    ua <- c(ua,t$estimate["mean of x"])
    ub <- c(ub,t$estimate["mean of y"])
    ci.max <- c(ci.max, t$conf.int[2])
    ci.min <- c(ci.min, t$conf.int[1])
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
    warning(paste("Failed to achieve significance in",maxiter,"iterations."))
  }
  
  df <-  data.frame(a,b)
  df$idx <- as.numeric(row.names(df))
  
  du <-  data.frame(a=ua,b=ub)
  du$idx <- as.numeric(row.names(du))
  
  dc <- data.frame(diff=ua-ub,lower=ci.min,upper=ci.max)
  dc$idx <- as.numeric(row.names(dc))
  
  pvals <- data.frame(p)
  pvals$idx <- as.numeric(row.names(pvals))
  
  df <- melt(df,measure.vars=c("a","b"),variable_name="group")
  du <- melt(du,measure.vars=c("a","b"),variable_name="group")
  
  if(count <= 100)
    trans <- 1
  else
    trans <- 1 / log10(count)
  
  list(count=count
       ,samples=df
       ,means=du
       ,conf.int=dc
       ,samples.plot=ggplot(data=df,aes(x=idx,y=value,color=group),size=1.5) + 
                     geom_point(alpha=I(trans)) + 
                     geom_line(data=du,size=2) +
                     scale_y_continuous(breaks= pretty_breaks())
       ,pvals=pvals
       ,pvals.plot=ggplot(data=pvals,aes(x=idx,y=p)) + 
                   geom_line() + 
                   geom_abline(intercept=alpha, slope=0, color="red",alpha=I(1/2)) +
                   scale_y_continuous(breaks= pretty_breaks(),limits=c(0,1))
       )
}

test <- simulate(maxiter=1000) 

pplot <- test$pvals.plot +  
            theme(axis.title.x = element_blank()
                  ,axis.text.x= element_blank()
                  ,axis.ticks.x=element_blank()
                  ,plot.margin=unit(c(1,1,-1,1), "lines")) 

ciplot <- test$samples.plot + 
            geom_ribbon(aes(x=idx,ymin=lower,ymax=upper,y=diff),color=NA,fill="black",alpha=I(1/10),data=test$conf.int) + 
            geom_line(aes(x=idx,y=diff),color="black",data=test$conf.int) + 
            xlab("sample") + 
            theme(legend.position = "none"
                  ,plot.margin=unit(c(0.5,1,1,1), "lines"))

combiplot <- arrangeGrob(pplot, ciplot, ncol=1, nrow=2, widths=c(4), heights=c(1, 4),plot=FALSE)


