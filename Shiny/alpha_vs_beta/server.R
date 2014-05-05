library(shiny)
library(ggplot2)
library(gridExtra)
library(scales)
library(reshape2)
library(zoo)


shinyServer(function(input, output) {
  output$distribution <- renderPlot({
        SD <- input$SD
        mean.pop <- 0
        mean.sample <- mean.pop + input$diff.mean
        max.x <- input$max
        min.x <- input$min
        alpha <- input$alphaValue
        beta <- qnorm(alpha,mean=mean.pop,sd=SD,lower.tail=FALSE)#input$betaValue
        pts <- 100
#        pts <- max - min
#         if(pts > 50 || pts < 20 ){
#           pts <- 50
#         }
        
        x <- seq(min.x,max.x,length.out=pts)
        pop <- dnorm(x,mean=mean.pop,sd=SD)
        smp <- dnorm(x,mean=mean.sample,sd=SD)
        
        ndata <- data.frame(x,pop,smp)
        nplot <- ggplot(data=ndata,aes(x=x)) + ylab("P(x)") + geom_line(aes(y=pop)) + geom_line(aes(y=smp))
        
        alphazone <- subset(ndata, pnorm(x,mean=mean.pop,sd=SD,lower.tail=FALSE) <= alpha)
        betazone <- subset(ndata, x <= min(alphazone$x))
        
        if (length(row.names(alphazone))){
          nplot <- nplot + geom_ribbon(aes(x=x,ymin=0,ymax=pop), data=alphazone, fill="blue",alpha=0.5)
        }
        
        if (length(row.names(betazone))){
          nplot <- nplot +geom_ribbon(aes(x=x,ymin=0,ymax=smp), data=betazone, fill="red",alpha=0.5)
        }
        
        print(nplot)
        
  })
})
