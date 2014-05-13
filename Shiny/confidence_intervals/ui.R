library(shiny)

shinyUI(fluidPage(
  titlePanel("Confidence Intervals"),
  
  sidebarLayout(
    sidebarPanel(h2("Simulation Parameters")
                 ,  sliderInput("conf.level"
                                ,"Confidence Level"
                                ,min = 0.01
                                ,max = 0.99
                                ,value = 0.95)
                 ,  sliderInput("sd"
                                ,"Standard Deviation"
                                ,min = 1
                                ,max = 10
                                ,value = 1)
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
                                ,animate=animationOptions(interval=2000,loop=TRUE))
                 ,h5("Features that may slow things down, but provide a finer picture")
                 ,  sliderInput("nsamples"
                                ,"Number of samples"
                                ,min = 1
                                ,max = 1000
                                ,value = 100)
                 ,  sliderInput("bw"
                                ,"Bin width for the historgram"
                                ,min = 0.001
                                ,max = 1
                                ,value = 0.1)
                 , actionButton("runagain",label = "Run Again")                
    )
    ,mainPanel(h2("Sample means")
               ,plotOutput("sample.means")
               #,h2("Confidence Interval (via t.test)")
               #,uiOutput("ttest")
               ,h2("Sample distributions")
               ,plotOutput("sample.distributions")
               ,h2("Population")
               ,plotOutput("population.distribution")
    )
  )
  
  
))
