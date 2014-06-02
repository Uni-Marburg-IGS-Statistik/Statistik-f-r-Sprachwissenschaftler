library(shiny)
library(ggplot2)
library(gridExtra)
library(scales)
library(reshape2)
library(zoo)


shinyServer(function(input, output) {
  #random.distribution <- function(min.val=-4,max.val=4,step=0.001,n=points) sample(seq(min.val,max.val,by=step),n,replace=TRUE)
  
  runSimulation <- reactive({
    # force update when user clicks on "Run Again"
    input$runagain
    n <- input$n
    random.vars.reuse <- input$reuse
    points <- input$points
    random.distribution <-  function() runif(points,min=-4,max=4)
    
    if(random.vars.reuse == "repeat"){
      r <- runif(points,min=-4,max=4)
      #cartesian.product <- eval(parse(text=paste("expand.grid(",paste(rep("r",n), collapse=", "),")")))
      #average.distribution <- apply(cartesian.product,1,sum) / n
      #average.distribution <- sapply(1:n,function(x) mean(r))

      plots <- list(
        random=qplot(r,geom="density") + theme(axis.title.x = element_blank())
        ,central=qplot(average.distribution,geom="density") + 
            theme(axis.title.x = element_blank()) + 
            scale_x_continuous(limits=c(-6,6))
      )
    }else{
      df.call <- "data.frame("
      for(i in 1:n){
        df.call <- paste0(df.call,ifelse(i > 1,",",""), "random.distribution()")
      }
      df.call <- paste0(df.call,")")
      df <- eval(expr = parse(text=df.call))
      df$index <- 1:points
      df <- melt(df,id.vars = "index",variable.name = "dist",value.name = "r")
      central <- ggplot(data=df) + geom_density(aes(x=r)) + theme(axis.title.x = element_blank()) 
      random <- central + facet_wrap(~dist) + theme(strip.background = element_blank(),strip.text.x = element_blank())
      plots <- list(random=random,central=central)
    }
  
    plots  
  })
  
  output$central <- renderPlot({
      plots <- runSimulation()
      print(plots$central)
  })
  
  output$random <- renderPlot({
    plots <- runSimulation()
    print(plots$random)
  })
})
