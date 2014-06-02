# Copyright 2014, Phillip Alday
#
# This file is part of Optional Stoppping.
#
# Optional Stopping is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
  t <- rep(NA,n-1)
  ua <- partialmean(a[1:n-1])
  ub <- partialmean(b[1:n-1])
  ci.min <- rep(NA,n-1)
  ci.max <- rep(NA,n-1)
  
  count <- n
  for(i in 1:maxiter){
    t0 <- t.test(a,b)
    t <- c(t,t0$statistic)
    p <- c(p,t0$p.value)
    ua <- c(ua,t0$estimate["mean of x"])
    ub <- c(ub,t0$estimate["mean of y"])
    ci.max <- c(ci.max, t0$conf.int[2])
    ci.min <- c(ci.min, t0$conf.int[1])
    if(t0$p.value <= alpha){
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
  
  tvals <- data.frame(t)
  tvals$idx <- as.numeric(row.names(tvals))
  
  
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
       ,tvals=tvals
       ,tvals.plot=ggplot(data=tvals,aes(x=idx,y=t)) + 
         geom_line() + 
         scale_y_continuous(breaks= pretty_breaks())
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


