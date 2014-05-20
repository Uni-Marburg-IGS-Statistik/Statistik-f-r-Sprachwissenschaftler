library(shiny)
library(ggplot2)
library(gridExtra)
library(scales)
library(reshape2)
library(zoo)
library(plyr)


shinyServer(function(input, output) {
  get.population <- reactive({
    # force update when user clicks on "New Population"
    input$new.population
    #print("New population")
    rnorm(input$population,sd=input$sd)
  })
  
  get.samples <- reactive({
    # force update when user clicks on "New Samples"
    input$new.samples
    population <- get.population()
    #print("New samples")
    data.frame(index=1: input$n,sapply(1: input$nsamples, function(x) sample(population,input$n)))
  })
  
  runSimulation <- reactive({
    population <- get.population()
    mu <- mean(population)
    samples <- get.samples()
    cis <- data.frame( sapply(samples, function(x) t.test(x,conf.level=input$conf.level)$conf.int) )
    cis <- data.frame(t(cis))
    names(cis) <- c("left","right")
    cis$sample <- row.names(cis)
    cis <- cis[2:(input$nsamples+1),]
    cis$`population mean` <- factor(ifelse(mu > cis$left & mu < cis$right,"hit","miss"), levels=c("miss","hit"))
    
    samples <- melt(samples, id.var="index")
    sample.means <- aggregate(value ~ variable, FUN=mean, data=samples)
    names(samples) <- c("index","sample","value")
    names(sample.means) <- c("sample","mean")
    #sorted.means <- sort(sample.means$mean)
    
    list(population=population, cis=cis, sample.means=sample.means, samples=samples)
  })

  output$sample.distributions <- renderPlot({
    x <- runSimulation()
    cis <- x$cis
    population <- x$population
    mu <- mean(population)
    sample.means <- x$sample.means
    samples <- x$samples
    
    plots <- ggplot(samples) + geom_density(aes(x=value)) +  scale_x_continuous(limits=c(-4,4)) + 
      facet_wrap(~sample) + 
      geom_vline(aes(xintercept=mean),linetype="dashed",data=sample.means) +
      geom_segment(aes(x=left,xend=right,y=0,yend=0,color=`population mean`),size=3,data=cis) + 
      scale_color_hue(limits=c("miss","hit")) + 
      geom_rect(aes(fill = `population mean`),xmin = -Inf,xmax = Inf,ymin = -Inf,ymax = Inf,alpha = 0.2,data=cis) +
      scale_fill_hue(limits=c("miss","hit")) + 
      guides(fill=FALSE) + 
      geom_vline(xintercept=mu) + 
      theme(axis.title.y = element_blank()
            ,axis.text.y = element_blank()
            ,axis.ticks.y = element_blank()
            ,strip.background = element_blank()
            ,axis.title.x = element_blank()
            ,strip.text.x = element_blank())
    print(plots)
  })

  output$population.distribution <- renderPlot({
    x <- runSimulation()
    cis <- x$cis
    population <- x$population
    sample.means <- x$sample.means
    
    pop <- qplot(population,geom="density") +  
      scale_x_continuous(limits=c(-4,4)) + xlab("") 
    
    if(input$sample.mean.overlay)
      pop <- pop + geom_vline(aes(xintercept=mean),data=sample.means, color="darkred",alpha=0.1,size=3) 
    
    pop <- pop + geom_vline(xintercept=mean(population),size=1)
    
    if(input$sample.ci.overlay)
      pop <- pop + geom_segment(aes(x=left,xend=right,y=0,yend=0),size=3,data=cis,alpha=0.1) 
    
    print(pop)
  })
})
