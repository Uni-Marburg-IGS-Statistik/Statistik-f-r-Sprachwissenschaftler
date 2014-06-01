library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    runExact <- reactive({
        print("new exact")
        n <- input$n
        s <- input$sides
        
        r <- 1:s
        cartesian.product <- eval(parse(text=paste("expand.grid(",paste(rep("r",n), collapse=", "),")")))
        cumulative.distribution <- apply(cartesian.product,1,sum)
        
        list(
            individual=qplot(as.factor(r),geom="histogram") + theme(axis.title.x = element_blank())
            ,cumulative=qplot(sapply(cumulative.distribution,as.factor),geom="histogram") + 
                theme(axis.title.x = element_blank())  
        )
    })
    
    runSimulation <- reactive({
        print("new simulation")
        input$runagain
        n <- input$n
        s <- input$sides
        t <- input$throws
        
        sim <- expand.grid(die=1:n,throw=1:t)
        sim$result <- sample.int(s,size=n*t,replace=TRUE)
        cumulative.distribution <- aggregate(result ~ throw, sim, sum)
        
        list(
            individual=qplot(as.factor(result),data=sim,geom="histogram") + 
                facet_wrap(~die) + 
                theme(axis.title.x = element_blank())
            ,cumulative=ggplot(cumulative.distribution) + 
                geom_histogram(aes(x=factor(result))) + 
                scale_x_discrete(labels=factor(seq(n*t))) + 
                theme(axis.title.x = element_blank())  
        )
        
    })
  
    output$individual <- renderPlot({
        print("hello world")
        if(input$type == "simulate"){
            plots <- runSimulation()
        }else if(input$type == "exact"){
            plots <- runExact()
        }
        print(plots$individual)
        
    })
    
    output$cumulative <- renderPlot({
        if(input$type == "simulate"){
            plots <- runSimulation()
        }else if(input$type == "exact"){
            plots <- runExact()
        }
        print(plots$cumulative)
    })
})
