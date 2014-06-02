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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Optional Stopping"),
  
  sidebarLayout(
    sidebarPanel(h3("Simulation Paramters")
                 ,  sliderInput("alphaValue"
                                ,"Significance Threshold"
                                ,min = 0.001
                                ,max = 0.1
                                ,value = 0.05)
                , h5("Advanced Settings")
                , numericInput("n"
                                ,"Initial Observations"
                                ,min = 2
                                ,max = 100
                                ,value = 10)
                , numericInput("maxiter"
                               ,"Iteration Limit"
                               ,min = 100
                               ,max = 5000
                               ,value = 3000)

                , actionButton("runagain",label = "Run Again")
     )
    ,mainPanel(h2("p-Values after every additional sample of two groups")
               ,plotOutput("pvalues")
               ,uiOutput("count")
               ,includeMarkdown("optional_stopping.md")
        )
  )
  
 
))
