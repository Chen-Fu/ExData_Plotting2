## Of the four types of sources indicated by the type (point,
## nonpoint, onroad, nonroad) variable, which of these four sources
## have seen decreases in emissions from 1999–2008 for Baltimore
## City? Which have seen increases in emissions from 1999–2008? Use
## the ggplot2 plotting system to make a plot answer this question.

library(dplyr)
library(ggplot2)

## Assume that files are in the right place
## Read files
## This will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Use tbl_df to change the type of NEI (In order to use functions
## in the package dplyr)
NEI <- tbl_df(NEI)

## Keep data with county number 24510
NEI <- filter(NEI, fips == "24510")


png("plot3.png")

ggplot(NEI, aes(x=year, y=Emissions, colour=type)) +
geom_smooth(alpha=0.1, method="loess") +
ggtitle("Total Emissions in Baltimore")

dev.off()