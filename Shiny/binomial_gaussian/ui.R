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

shinyUI(fluidPage(titlePanel("From the binomial distribution to the Gaussian"),
    
    sidebarLayout(sidebarPanel(h3("Simulation Parameters")
         ,selectInput("sides"
            ,"Number of sides pro die / coin"
            ,c(2,4,6,8,10,12,20)
            ,selectize=FALSE)
        ,uiOutput("num.dice")
        ,radioButtons("type"
            ,"Simulate"
            ,choices=c("Exact solution"="exact","Simulate"="simulate"))
        ,conditionalPanel("input.type == 'simulate'"
            ,sliderInput("throws"
               ,"Number of throws per coin / die"
               ,min = 1
               ,max = 10000
               ,value = 100)
        )
        ,actionButton("runagain",label = "Run Again")
        )
    ,mainPanel(h2("Individual Dice / Coins")
        ,plotOutput("individual")
        ,h2("Cumulative Distribution")
        ,plotOutput("cumulative")
        )
      )
))
