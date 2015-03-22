# Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County,
# California (fips == "06037"). Which city has seen greater changes
# over time in motor vehicle emissions?

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

NEI <- filter(NEI, (fips == "24510") | (fips == "06037") , type == "ON-ROAD")

## Replace fips to city names
len <- length(NEI$fips)
for ( i in 1 : len){
    if( NEI$fips[i] == "24510"){
        NEI$fips[i] <- "Baltimore"
    }else if( NEI$fips[i] == "06037"){
        NEI$fips[i] <- "Los Angeles"
    }else{
    }
}

## Make a plot
png("plot6.png")

ggplot(NEI, aes(x=year, y=Emissions, colour=fips)) +
geom_smooth(alpha=0.1, method="loess") +
ggtitle("Total Emissions in Baltimore and Los Angeles")

dev.off()