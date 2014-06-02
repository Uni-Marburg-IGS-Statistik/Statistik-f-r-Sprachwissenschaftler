# Copyright 2014, Phillip Alday
#
# This file is part of Central Limit Theorem.
#
# Central Limit Theorem is free software: you can redistribute it and/or modify
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
library(gridExtra)
library(scales)
library(reshape2)
library(zoo)


shinyServer(function(input, output) {
  #random.distribution <- function(min.val=-4,max.val=4,step=0.001,n=points) sample(seq(min.val,max.val,by=step),n,replace=TRUE)
  
  runSimulation <- reactive({
    # force update when user clicks on "Run Again"
    input$runagain
    n <- input$n
    random.vars.reuse <- input$reuse
    points <- input$points
    random.distribution <-  function() runif(points,min=-4,max=4)
    
    if(random.vars.reuse == "repeat"){
      r <- runif(points,min=-4,max=4)
      #cartesian.product <- eval(parse(text=paste("expand.grid(",paste(rep("r",n), collapse=", "),")")))
      #average.distribution <- apply(cartesian.product,1,sum) / n
      #average.distribution <- sapply(1:n,function(x) mean(r))

      plots <- list(
        random=qplot(r,geom="density") + theme(axis.title.x = element_blank())
        ,central=qplot(average.distribution,geom="density") + 
            theme(axis.title.x = element_blank()) + 
            scale_x_continuous(limits=c(-6,6))
      )
    }else{
      df.call <- "data.frame("
      for(i in 1:n){
        df.call <- paste0(df.call,ifelse(i > 1,",",""), "random.distribution()")
      }
      df.call <- paste0(df.call,")")
      df <- eval(expr = parse(text=df.call))
      df$index <- 1:points
      df <- melt(df,id.vars = "index",variable.name = "dist",value.name = "r")
      central <- ggplot(data=df) + geom_density(aes(x=r)) + theme(axis.title.x = element_blank()) 
      random <- central + facet_wrap(~dist) + theme(strip.background = element_blank(),strip.text.x = element_blank())
      plots <- list(random=random,central=central)
    }
  
    plots  
  })
  
  output$central <- renderPlot({
      plots <- runSimulation()
      print(plots$central)
  })
  
  output$random <- renderPlot({
    plots <- runSimulation()
    print(plots$random)
  })
})
