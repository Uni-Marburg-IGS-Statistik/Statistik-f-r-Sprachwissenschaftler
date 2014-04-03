library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$pvalues <- renderPlot({
                  # force update when user clicks on "Run Again"
                  input$runagain
                  #disp <- qplot(carat, price, data = diamonds)
                  #print(disp)
                  
                  a <- rnorm(n)
                  b <- rnorm(n)
                  
                  count <- input$n
                  
                  while(TRUE){
                    t <- t.test(a,b)
                    
                    if(t$p.value <= input$alphaValue){
                      break
                    }
                    
                    count <- count + input$increment
                    a <- c(a,rnorm(input$increment))
                    b <- c(b,rnorm(input$increment))
                  }
                  
                  print(count)
                  
  })
})
