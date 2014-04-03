library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Optional Stopping"),
  
  sidebarLayout(
    sidebarPanel(h2("Desired Alpha Level")
                 , sliderInput("alphaValue"
                             , label=h5("Significance level")
                             , min = 0.001
                             , max = 0.1
                             , value = 0.05)
                 , sliderInput("n"
                               , label=h5("Initial observations")
                               , min = 2
                               , max = 100
                               , value = 10
                               , round = TRUE
                               )
                 , h3("Additional Simulation Parameters")
                 , sliderInput("increment"
                               , label=h5("Increment between checks")
                               , min = 2
                               , max = 100
                               , value = 10
                               , round = TRUE
                 )
                 , sliderInput("maxiter"
                               , label=h5("Maximum iterations before quiting")
                               , min = 100
                               , max = 10000
                               , value = 5000
                               , round = TRUE
                 )
                , actionButton("runagain",label = "Run Again")
     )
    ,mainPanel(h2("Progression of p-values")
                , plotOutput("pvalues")
     )
  ) 
 
))
