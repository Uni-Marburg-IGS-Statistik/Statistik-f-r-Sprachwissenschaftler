# Copyright 2014, Phillip Alday
#
# This file is part of Optional Stoppping.
#
# Optional Stopping is free software: you can redistribute it and/or modify
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
library(reshape)
library(zoo)

source("optional_stopping.R")

shinyServer(function(input, output) {
  runSimulation <- reactive({
    # force update when user clicks on "Run Again"
    input$runagain
    simulate(n=input$n,alpha=input$alphaValue,maxiter=input$maxiter)
  })
  output$count <- renderUI({
        sim <- runSimulation()
        p <- signif(tail(sim$pvals$p,n=1),3)
        if(p < input$alphaValue)
          paste0("On sample number ",sim$count,", you reached a p-value of ",p, "!")
        else
          HTML(paste0("<div style='color:red'>Uh oh, it looks like we failed to achieve the preset significance threshold "
                ,"before hitting the iteration limit. Try running the simulation again!</div>"))
  })
  output$pvalues <- renderPlot({
        test <- runSimulation()
        
        tplot <- test$tvals.plot +  
          theme(axis.title.x = element_blank()
                ,axis.text.x= element_blank()
                ,axis.ticks.x=element_blank()
                ,plot.margin=unit(c(1,1,-0.75,1), "lines")) 
        
        pplot <- test$pvals.plot +  
          theme(axis.title.x = element_blank()
                ,axis.text.x= element_blank()
                ,axis.ticks.x=element_blank()
                ,plot.margin=unit(c(0.5,1,-0.75,1), "lines")) 
        
        ciplot <- test$samples.plot + 
          geom_ribbon(aes(x=idx,ymin=lower,ymax=upper,y=diff),color=NA,fill="black",alpha=I(1/8),data=test$conf.int) + 
          geom_line(aes(x=idx,y=diff),color="black",data=test$conf.int) + 
          xlab("sample") + 
          theme(legend.position = "none"
                ,plot.margin=unit(c(0.5,1,1,1), "lines"))
        
        combiplot <- arrangeGrob(tplot, pplot, ciplot, ncol=1, nrow=3, widths=c(4), heights=c(1, 1, 4))
        print(combiplot)
        
  })
})
