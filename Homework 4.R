library(here)
library(tidyverse)
library(patchwork)


WOTUnfiltered <- read.csv("WOT.csv")

WOT <- subset(WOTUnfiltered, WOTUnfiltered$Battles>=4)

WOT$"WR" <- as.numeric(sub("%","",WOT$"WR"))

plot_a <- ggplot(WOT, mapping = aes(X=reorder(Nation, WR, na.rm=TRUE), y=WR)) + labs(title="Stats by Nation", x= "Nation Played", y= "Win Rate (WR)")
a <- plot_a + geom_boxplot()

plot_b <- ggplot(WOT, mapping = aes(X=reorder(Class, WR, na.rm=TRUE), y=WR)) + labs(title="Stats by Type Played", x= "Type Played", y= "Win Rate (WR)")
b <- plot_b + geom_boxplot()

a + b
 
