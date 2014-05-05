# ggplot laden
library(ggplot2)

# Daten auslesen
rtdata <- read.table("Burkm/priming.tab",header=TRUE)
rt.zentriert <- rtdata$RT - mean(rtdata$RT)
#print(rt.zentriert)

# Funktion:
rt.z2 <- scale(rtdata$RT)
#print(rt.z2)

