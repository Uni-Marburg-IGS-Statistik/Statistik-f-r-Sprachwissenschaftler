# Copyright 2014, Phillip Alday
#
# This file is part of Confidence Intervals.
#
# Confidence Intervals is free software: you can redistribute it and/or modify
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
require(markdown)

shinyUI(fluidPage(
  titlePanel("Confidence Intervals"),
  
  sidebarLayout(
    sidebarPanel(h2("Simulation Parameters")
                 ,  sliderInput("conf.level"
                                ,"Confidence Level"
                                ,min = 0.01
                                ,step = 0.01
                                ,max = 0.99
<<<<<<< HEAD
                                ,value = 0.95)
=======
                                ,value = 0.95
                                ,format = "#.##"
                                ,animate=animationOptions(interval=6000,loop=TRUE))
>>>>>>> 2d35a226033d802734551a5f346bca9d24ad9652
                 ,  sliderInput("sd"
                                ,"Standard Deviation"
                                ,min = 1
                                ,max = 10
<<<<<<< HEAD
                                ,value = 1)
=======
                                ,value = 1
                                ,animate=animationOptions(interval=6000,loop=TRUE))
<<<<<<< HEAD
>>>>>>> 2d35a226033d802734551a5f346bca9d24ad9652
=======
                 ,fluidRow(column(6,actionButton("new.samples",label = "New Samples"))
                          ,column(6,actionButton("new.population",label = "New Population"))
                          )
                 ,h5("Population Plot")
                 ,fluidRow(column(6,radioButtons("sample.mean.overlay","Display sample means",c("yes"=TRUE,"no"=FALSE),selected=FALSE))
                          ,column(6,radioButtons("sample.ci.overlay","Display sample CIs",c("yes"=TRUE,"no"=FALSE),selected=FALSE))
                          )
                ,h2("Population")
                 ,plotOutput("population.distribution")
                 ,h2("Advanced Settings")
                 ,h5("Features that may slow things down, but provide a finer picture")
>>>>>>> c36f07d9f256c9b799dd8239e71bbc1fb7028ae8
                 ,  sliderInput("population"
                                ,"Number of points to simulate for the population"
                                ,min = 10
                                ,max = 10000
                                ,value = 250)
                 ,  sliderInput("n"
                                ,"Number of points to use in each sample"
                                ,min = 1
                                ,max = 100
                                ,value = 10,
<<<<<<< HEAD
                                ,animate=animationOptions(interval=2000,loop=TRUE))
=======
                                ,animate=animationOptions(interval=6000,loop=TRUE))
<<<<<<< HEAD
>>>>>>> 2d35a226033d802734551a5f346bca9d24ad9652
                 ,h5("Features that may slow things down, but provide a finer picture")
=======
>>>>>>> c36f07d9f256c9b799dd8239e71bbc1fb7028ae8
                 ,  sliderInput("nsamples"
                                ,"Number of samples"
                                ,min = 1
                                ,max = 1000
                                ,value = 100)
                 
    )
<<<<<<< HEAD
    ,mainPanel(h2("Sample means")
               ,plotOutput("sample.means")
               #,h2("Confidence Interval (via t.test)")
               #,uiOutput("ttest")
<<<<<<< HEAD
               ,h2("Sample distributions")
               ,plotOutput("sample.distributions")
               ,h2("Population")
               ,plotOutput("population.distribution")
=======
               ,h2("Population")
               ,plotOutput("population.distribution")
               ,h2("Sample distributions")
=======
    ,mainPanel(h2("Sample distributions")
>>>>>>> c36f07d9f256c9b799dd8239e71bbc1fb7028ae8
               ,plotOutput("sample.distributions",height=768)
               ,includeMarkdown("confidence_intervals.md")

>>>>>>> 2d35a226033d802734551a5f346bca9d24ad9652
    )
  )
  
  
))
