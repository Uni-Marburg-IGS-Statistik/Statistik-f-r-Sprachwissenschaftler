library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("The relationship of significance level (alpha) to beta error"),
  
  sidebarLayout(
    sidebarPanel(h2("Experimental Parameters")
                 ,  sliderInput("alphaValue"
                                ,"Significance / Sensitivity Threshold"
                                ,min = 0.01
                                ,max = 1.0
                                ,value = 0.05)
#                  , sliderInput("betaValue"
#                              ,"Specificity Threshold"
#                              ,min = 0.01
#                              ,max = 1.0
#                              ,value = 0.05)
                , numericInput("max"
                             ,"Max x to plot"
                             ,value = 10)
                , numericInput("min"
                               ,"min x to plot"
                               ,value = -10)
                , numericInput("SD"
                               ,"standard deviation"
                               ,value = 1)
                , numericInput("diff.mean"
                                 ,"True difference in means"
                                 ,value = 1)
     )
    ,mainPanel(h2("Hits and misses at a given significance level.")
               ,plotOutput("distribution")
                ,p("Blue is correctly detected, red is incorrectly dismissed.")
              )
  )
  
 
))
