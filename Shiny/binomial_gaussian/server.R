# Copyright 2014, Phillip Alday
#
# This file is part of Binomial to Gaussian.
#
# Binomial to Gaussian is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    output$num.dice <- renderUI({
      s <- as.numeric(input$sides)
      sliderInput("n"
        ,"Number of dice / coins"
        ,min = 1
        ,max = max(2, round(30 / s))
        ,value = 2)
    })
  
    runExact <- reactive({
        n <- input$n
        s <- as.numeric(input$sides)
        
        r <- 1:s
        cartesian.product <- eval(parse(text=paste("expand.grid(",paste(rep("r",n), collapse=", "),")")))
        cumulative.distribution <- apply(cartesian.product,1,sum)
        
        list(
            individual=qplot(as.factor(r),geom="histogram") + theme(axis.title.x = element_blank())
            ,cumulative=qplot(sapply(cumulative.distribution,as.factor),geom="histogram") + 
                theme(axis.title.x = element_blank())  
        )
    })
    
    runSimulation <- reactive({
        input$runagain
        n <- input$n
        s <- input$sides
        t <- input$throws
        
        sim <- expand.grid(die=1:n,throw=1:t)
        sim$result <- sample.int(s,size=n*t,replace=TRUE)
        cumulative.distribution <- aggregate(result ~ throw, sim, sum)
        
        list(
            individual=qplot(as.factor(result),data=sim,geom="histogram") + 
                facet_wrap(~die) + 
                theme(axis.title.x = element_blank())
            ,cumulative=ggplot(cumulative.distribution) + 
                geom_histogram(aes(x=factor(result))) + 
                scale_x_discrete(labels=factor(seq(n*t))) + 
                theme(axis.title.x = element_blank())  
        )
        
    })
  
    output$individual <- renderPlot({
        if(input$type == "simulate"){
            plots <- runSimulation()
        }else if(input$type == "exact"){
            plots <- runExact()
        }
        print(plots$individual)
        
    })
    
    output$cumulative <- renderPlot({
        if(input$type == "simulate"){
            plots <- runSimulation()
        }else if(input$type == "exact"){
            plots <- runExact()
        }
        print(plots$cumulative)
    })
})
