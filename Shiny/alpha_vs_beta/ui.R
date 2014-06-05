# Copyright 2014, Phillip Alday
#
# This file is part of Alpha vs Beta.
#
# Alpha vs Beta is free software: you can redistribute it and/or modify
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
