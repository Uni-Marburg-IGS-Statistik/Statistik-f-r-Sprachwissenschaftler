library(shiny)

shinyUI(fluidPage(titlePanel("From the binomial distribution to the Gaussian"),
    
    sidebarLayout(sidebarPanel(h2("Simulation Parameters")
        ,sliderInput("n"
            ,"Number of dice / coins"
            ,min = 2
            ,max = 100
            ,value = 2
            ,round=TRUE)
        ,selectInput("sides"
            ,"Number of sides pro die / coin"
            ,c(2,4,6,8,20)
            ,selectize=FALSE)
        ,sliderInput("throws"
            ,"Number of throws per coin / die"
            ,min = 1
            ,max = 10000
            ,value = 100
            ,round=TRUE)
        ,radioButtons("type"
            ,"Simulate"
            ,choices=c("Exact solution"="exact","Simulate"="simulate"))
        ,actionButton("runagain",label = "Run Again"))
    ,mainPanel(h2("Individual Dice / Coins")
        ,plotOutput("individual")
        ,h2("Cumulative Distribution")
        ,plotOutput("cumulative"))
)))
