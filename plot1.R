## Have total emissions from PM2.5 decreased in the United States
## from 1999 to 2008? Using the base plotting system, make a plot
## showing the total PM2.5 emission from all sources for each of the
## years 1999, 2002, 2005, and 2008.

## Assume that files are in the right place
## Read the files
## This will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#  sum emissions by years
total <- tapply(NEI$Emissions, NEI$year, sum)

## Draw a graph and save it
png(filename = "plot1.png")

    barplot(total, main = "Total PM2.5 emission", xlab="Year", ylab="Emissions (tons)")

dev.off()

