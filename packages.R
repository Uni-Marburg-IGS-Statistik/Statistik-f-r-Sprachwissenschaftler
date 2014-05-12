packages.used <- c("knitr","knitcitations"
                   ,"ggplot2"
                   ,"plyr"
                   ,"languageR"
                   ,"reshape2"
                   ,"reshape"
                   ,"sn"
                   )

install.packages(packages.used,dependencies = TRUE)

# Debian/Ubuntu-Nutzer  
# sudo apt-get install libxml2-dev libcurl4-openssel-dev jags