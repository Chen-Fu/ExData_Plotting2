## Across the United States, how have emissions from coal combustion-related
## sources changed from 1999–2008?
library(ggplot2)

## Assume that files are in the right place
## Read files
## This will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal-related SCC
coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

# Merges two data sets
data <- merge(x = NEI, y = coal, by = "SCC")
data_sum <- aggregate(data[, "Emissions"], by = list(merge$year), sum)
colnames(data_sum) <- c("Year", "Emissions")

png("plot4.png")
ggplot(data = data_sum, aes(x = Year, y = Emissions)) +
geom_line(aes(group = 1, col = Emissions)) +
ggtitle(expression("Total Emissions across the US")) +
ylab("Emissions (in tons)")
dev.off()