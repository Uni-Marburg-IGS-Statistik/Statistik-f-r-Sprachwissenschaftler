library(shiny)
library(ggplot2)
library(gridExtra)
library(scales)
library(reshape2)
library(zoo)


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
    samples <- get.samples()
    samples <- melt(samples, id.var="index")
    sample.means <- aggregate(value ~ variable, FUN=mean, data=samples)
    names(samples) <- c("index","sample","value")
    names(sample.means) <- c("sample","mean")
    sorted.means <- sort(sample.means$mean)
    left <- (1 - input$conf.level) / 2 * length(sorted.means)
    right <- length(sorted.means) - left
    left <- sorted.means[left]
    right <- sorted.means[right]
    
    #bw <- diff(range(sample.means$mean)) / input$n
    bw <- input$bw
    m <- ggplot(sample.means) + 
      geom_histogram(aes(x=mean,y=..density..),binwidth=bw,color="black",alpha=0.9,position="dodge") +  
      scale_x_continuous(limits=c(-4,4)) + 
      geom_vline(xintercept=left,color="darkred") +  
      geom_vline(xintercept=right,color="darkred")
    dist <- ggplot(samples) + geom_density(aes(x=value)) +  
      # geom_vline(aes(xintercept=mean(value)), color="darkred") +
      scale_x_continuous(limits=c(-4,4)) + 
      facet_wrap(~sample) + theme(strip.background = element_blank(),strip.text.x = element_blank()) 
    plots <- list(distributions=dist,means=m)
  
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
  
  output$sample.means <- renderPlot({
      plots <- runSimulation()
      print(plots$means)
  })
  
  output$sample.distributions <- renderPlot({
    plots <- runSimulation()
    print(plots$distributions)
  })

  output$population.distribution <- renderPlot({
    population <- get.population()
    popplot <- qplot(population,geom="density") +  
      scale_x_continuous(limits=c(-4,4)) + 
      geom_vline(xintercept=mean(population), color="darkred")
    print(popplot)
  })
})
