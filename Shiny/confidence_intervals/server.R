library(shiny)
library(ggplot2)
library(gridExtra)
library(scales)
library(reshape2)
library(zoo)
library(plyr)


shinyServer(function(input, output) {
  get.population <- reactive({
    # force update when user clicks on "Run Again"
    input$runagain
    #print("New population")
    rnorm(input$population,sd=input$sd)
  })
  
  get.samples <- reactive({
    # force update when user clicks on "Run Again"
    input$runagain
    population <- get.population()
    #print("New samples")
    data.frame(index=1: input$n,sapply(1: input$nsamples, function(x) sample(population,input$n)))
  })
  
  runSimulation <- reactive({
    # force update when user clicks on "Run Again"
    input$runagain # alpha sd populatio n
    
    population <- get.population()
    mu <- mean(population)
    samples <- get.samples()
    cis <- data.frame( sapply(samples, function(x) t.test(x,conf.level=input$conf.level)$conf.int) )
    cis <- data.frame(t(cis))
    names(cis) <- c("left","right")
    cis$sample <- row.names(cis)
    cis <- cis[2:(input$nsamples+1),]
    cis$`population mean` <- factor(ifelse(mu > cis$left & mu < cis$right,"hit","miss"))
    cis$`population mean` <- relevel(cis$`population mean`,ref="miss")
    
    samples <- melt(samples, id.var="index")
    sample.means <- aggregate(value ~ variable, FUN=mean, data=samples)
    names(samples) <- c("index","sample","value")
    names(sample.means) <- c("sample","mean")
    #sorted.means <- sort(sample.means$mean)
    
    
    dist <- ggplot(samples) + geom_density(aes(x=value)) +  scale_x_continuous(limits=c(-4,4)) + 
      facet_wrap(~sample) + 
      geom_vline(aes(xintercept=mean),linetype="dashed",data=sample.means) +
      geom_segment(aes(x=left,xend=right,y=0,yend=0,color=`population mean`),size=3,data=cis) + 
      geom_rect(aes(fill = `population mean`),xmin = -Inf,xmax = Inf,ymin = -Inf,ymax = Inf,alpha = 0.2,data=cis) +
      guides(fill=FALSE) + 
      geom_vline(aes(xintercept=mean(population))) + 
      theme(axis.title.y = element_blank()
            ,axis.text.y = element_blank()
            ,axis.ticks.y = element_blank(),
            strip.background = element_blank(),
            strip.text.x = element_blank())
    
    pop <- qplot(population,geom="density") +  
      scale_x_continuous(limits=c(-4,4)) + 
      geom_vline(aes(xintercept=mean),data=sample.means, color="darkred",alpha=0.1,size=3) + 
      geom_vline(xintercept=mean(population),size=1) +
      geom_segment(aes(x=left,xend=right,y=0,yend=0),size=3,data=cis,alpha=0.1) 
      
    
    plots <- list(distributions=dist,population=pop)
  
    plots  
  })
  
  output$ttest <- renderUI({
    # first column is index, second column is first sample
    s <- get.samples()[,2]
    #print(head(get.samples()))
    #print(s)
    s.text <- paste0(s,collapse=", ")
    t <- t.test(s,conf.level = input$conf.level)
    text <- paste0("The confidence interval calculated from the first sample is ",t$conf.int[1], " to ", t$conf.int[2], " with mean ",mean(s),".")
    #paste(text, "For reference, this sample was:", s.text)
    
    "More explanatory text coming soon."
  })
  
  output$sample.distributions <- renderPlot({
    plots <- runSimulation()
    print(plots$distributions)
  })

  output$population.distribution <- renderPlot({
    plots <- runSimulation()
    print(plots$distributions)
    print(plots$population)
  })
})
