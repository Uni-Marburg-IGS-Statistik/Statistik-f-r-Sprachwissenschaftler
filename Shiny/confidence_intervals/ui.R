library(shiny)

shinyUI(fluidPage(
  titlePanel("Confidence Intervals"),
  
  sidebarLayout(
    sidebarPanel(h2("Simulation Parameters")
                 ,  sliderInput("conf.level"
                                ,"Confidence Level"
                                ,min = 0.01
                                ,max = 0.99
                                ,value = 0.95
                                ,animate=animationOptions(interval=6000,loop=TRUE))
                 ,  sliderInput("sd"
                                ,"Standard Deviation"
                                ,min = 1
                                ,max = 10
                                ,value = 1
                                ,animate=animationOptions(interval=6000,loop=TRUE))
                 ,fluidRow(column(6,actionButton("new.samples",label = "New Samples"))
                          ,column(6,actionButton("new.population",label = "New Population"))
                          )
                 ,h5("Population Plot")
                 ,fluidRow(column(6,radioButtons("sample.mean.overlay","Display sample means",c("yes"=TRUE,"no"=FALSE),selected=FALSE))
                          ,column(6,radioButtons("sample.ci.overlay","Display sample CIs",c("yes"=TRUE,"no"=FALSE),selected=FALSE))
                          )
                ,h2("Population")
                 ,plotOutput("population.distribution")
                 ,h2("Advanced Settings")
                 ,h5("Features that may slow things down, but provide a finer picture")
                 ,  sliderInput("population"
                                ,"Number of points to simulate for the population"
                                ,min = 10
                                ,max = 10000
                                ,value = 250)
                 ,  sliderInput("n"
                                ,"Number of points to use in each sample"
                                ,min = 1
                                ,max = 100
                                ,value = 10,
                                ,animate=animationOptions(interval=6000,loop=TRUE))
                 ,  sliderInput("nsamples"
                                ,"Number of samples"
                                ,min = 1
                                ,max = 1000
                                ,value = 100)
                 
    )
    ,mainPanel(h2("Sample distributions")
               ,plotOutput("sample.distributions",height=768)

    )
  )
  
  
))
