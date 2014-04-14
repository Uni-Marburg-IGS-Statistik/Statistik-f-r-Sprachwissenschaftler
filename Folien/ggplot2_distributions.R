# visualization example
# adapted from http://www.r-bloggers.com/ggplot2-cheatsheet-for-visualizing-distributions/0
library(ggplot2)
library(gridExtra)
set.seed(10005)

width <- c(rnorm(1500, mean = -1), rnorm(1500, mean = 1.5))
height <- c(rnorm(1500, mean = 1), rnorm(1500, mean = 1.5))
zvar <- as.factor(c(rep(1, 1500), rep(2, 1500)))
xy <- data.frame(width, height, zvar)

#placeholder plot - prints nothing at all
empty <- ggplot()+geom_point(aes(1,1), colour="white") +
  theme(                              
    plot.background = element_blank(), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    panel.border = element_blank(), 
    panel.background = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank()
  )

#scatterplot of x and y variables
scatter <- ggplot(xy,aes(width, height)) + 
  geom_point(aes(color=zvar),alpha=I(1/2)) + 
  scale_color_manual(values = c("orange", "purple")) +
  theme(legend.position = "none")

#marginal density of x - plot on top
plot_top <- ggplot(xy, aes(width, fill=zvar)) + 
  geom_density(alpha=.5) + 
  scale_fill_manual(values = c("orange", "purple")) + 
  theme(legend.position = "none") +
  theme(axis.title.x = element_blank()
        ,axis.text.x= element_blank()
        ,axis.ticks.x=element_blank()
        ,plot.margin=unit(c(1,1,-0.8,1), "lines"))

#marginal density of y - plot on the right
plot_right <- ggplot(xy, aes(height, fill=zvar)) + 
  geom_density(alpha=.5) + 
  coord_flip() + 
  scale_fill_manual(values = c("orange", "purple")) + 
  theme(legend.position = "none") + 
  theme(axis.title.y = element_blank()
        ,axis.text.y= element_blank()
        ,axis.ticks.y=element_blank()
        ,plot.margin=unit(c(1,1,1,-1), "lines"))

#arrange the plots together, with appropriate height and width for each row and column
plot2d <- arrangeGrob(plot_top, empty, scatter, plot_right, ncol=2, nrow=2, widths=c(5, 1), heights=c(1, 5))