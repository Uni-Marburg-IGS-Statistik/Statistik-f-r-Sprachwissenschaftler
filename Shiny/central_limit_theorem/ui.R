library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Central Limit Theoremr"),
  
  sidebarLayout(
    sidebarPanel(h2("Simulation Parameters")
                 ,  sliderInput("n"
                                ,"Number of random variables to sum"
                                ,min = 1
                                ,max = 100
                                ,value = 5)
                 ,  sliderInput("points"
                                ,"Number of points to simulate for each random variable"
                                ,min = 10
                                ,max = 1000
                                ,value = 100)
                , radioButtons("reuse"
                                 ,"Use the same random variable?"
                                 ,choices=c("Repeat the same random variable"="repeat","Use different random variables"="distinct"))
                , actionButton("runagain",label = "Run Again")                
     )
    ,mainPanel(h2("Random variable(s)")
               ,plotOutput("random")
               ,h2("Summed Distribution")
               ,plotOutput("central")
              )
  )
  
 
))
