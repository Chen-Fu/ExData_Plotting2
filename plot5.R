# How have emissions from motor vehicle sources changed from 1999–
# 2008 in Baltimore City?

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
SCC <- tbl_df(SCC)

## Keep data with county number 24510 & type "ON-ROAD"
## It's consistent with the criteria "emissions from motor vehicle sources"

NEI <- filter(NEI, fips == "24510", type == "ON-ROAD")

## Sum emissions by years
total <- tapply(NEI$Emissions, NEI$year, sum)

## make a plot
png(filename = "plot5.png")

barplot(total, main = "Emissions from motor vehicle sources in Baltimore", xlab="Year", ylab="Emissions (tons)")

dev.off()
