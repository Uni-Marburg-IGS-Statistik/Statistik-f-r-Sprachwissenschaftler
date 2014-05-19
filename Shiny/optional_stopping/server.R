library(shiny)
library(ggplot2)
library(gridExtra)
library(scales)
library(reshape)
library(zoo)

source("optional_stopping.R")

shinyServer(function(input, output) {
  runSimulation <- reactive({
    # force update when user clicks on "Run Again"
    input$runagain
    simulate(n=input$n,alpha=input$alphaValue,maxiter=input$maxiter)
  })
  output$count <- renderUI({
        sim <- runSimulation()
        p <- tail(sim$pvals$p,n=1)
        if(p < input$alphaValue)
          paste0("On sample number ",sim$count,", you reached a p-value of ",p, "!")
        else
          HTML(paste0("<div style='color:red'>Uh oh, it looks like we failed to achieve the preset significance threshold "
                ,"before hitting the iteration limit. Try running the simulation again!</div>"))
  })
  output$pvalues <- renderPlot({
        test <- runSimulation()
        
        tplot <- test$tvals.plot +  
          theme(axis.title.x = element_blank()
                ,axis.text.x= element_blank()
                ,axis.ticks.x=element_blank()
                ,plot.margin=unit(c(1,1,-0.75,1), "lines")) 
        
        pplot <- test$pvals.plot +  
          theme(axis.title.x = element_blank()
                ,axis.text.x= element_blank()
                ,axis.ticks.x=element_blank()
                ,plot.margin=unit(c(0.5,1,-0.75,1), "lines")) 
        
        ciplot <- test$samples.plot + 
          geom_ribbon(aes(x=idx,ymin=lower,ymax=upper,y=diff),color=NA,fill="black",alpha=I(1/8),data=test$conf.int) + 
          geom_line(aes(x=idx,y=diff),color="black",data=test$conf.int) + 
          xlab("sample") + 
          theme(legend.position = "none"
                ,plot.margin=unit(c(0.5,1,1,1), "lines"))
        
        combiplot <- arrangeGrob(tplot, pplot, ciplot, ncol=1, nrow=3, widths=c(4), heights=c(1, 1, 4))
        print(combiplot)
        
  })
})
