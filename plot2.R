## Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (fips == "24510") from 1999 to 2008? Use the base
## plotting system to make a plot answering this question

library(dplyr)

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

## Sum emissions by years
total <- tapply(NEI$Emissions, NEI$year, sum)

## Draw a graph and save it
png(filename = "plot2.png")

barplot(total, main = "Total PM2.5 emission in Baltimore", xlab="Year", ylab="Emissions (tons)")

dev.off()