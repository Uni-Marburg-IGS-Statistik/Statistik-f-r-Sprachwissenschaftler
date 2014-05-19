library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Optional Stopping"),
  
  sidebarLayout(
    sidebarPanel(h2("Simulation Paramters")
                 ,  sliderInput("alphaValue"
                                ,"Significance Threshold"
                                ,min = 0.001
                                ,max = 0.1
                                ,value = 0.05)
                , h3("Advanced Settings")
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
    ,mainPanel(h1("p-Values after every additional sample of two groups")
               ,plotOutput("pvalues")
               ,uiOutput("count")
               ,h1("What am I looking at?")
               ,p(paste0("This simple app shows the problem of optional stopping. Even though the two groups are sampled "
                        ,"from the same distribution, you will generally get a significant difference for any given p at "
                        ,"some point. (Well, always, if you have time to let an obscence number of iterations run.) The "
                        ,"solid lines represent the estimated mean for each group up until that point, the dark line "
                        ,"represents the difference between the means and the shading around that represents the 95% confidence interval."
                        ," p-Values and confidence intervals are not calculated on a rolling basis for the inital observations."))
              ,h1("Why do I care?")
              ,p(HTML(paste0("Well, not jump on the big bandwagon of all the literature about how problematic p-values are, but you can"
                        ," see here that they vary wildly and don't seem to converge to any one particular value for larger samples." 
                        ,"Indeed, they seem to be randomly distributed and their curve resembles Brownian motion. Interestingly, even"
                        ," though the two group means slowly converge upon each other, you'll often see the p-value become significant"
                        ," for a very small, vanishing difference. This illustrates the importance of taking <b>effect size</b> into "
                        ,"consideration. On the other hand, the <b>confidence interval</b> seems to continuously converge towards the "
                        ,"true mean difference, i.e. 0. More data gives us via confidence intervals better estimates of the true "
                        ,"difference, while more data doesn't necessarily give us consistently better p-values. Indeed, the p-value "
                        ,"measures how likely it is that this result would happen for <b>one</b> experiment, assuming that there is "
                        ,"no difference between the groups. The rolling p-value calculation used in optional stopping effectively "
                        ,"performs a new experiment for each additional data point. As such, our 'correct' significance level after"
                        ," n stopping points would be our starting significance level divided by n (Bonferroni correction)!")))
        )
  )
  
 
))
