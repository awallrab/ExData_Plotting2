### plot3.R
library(dplyr)

# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter for baltimore
baltimore <- filter(NEI, fips == "24510")
# sum up emmissions
total_baltimore <- aggregate(Emissions~year+type, baltimore, sum)

# create plot
library(ggplot2)
qplot(data=total_baltimore, year, Emissions, color=type, geom="path", xlab="Year", ylab="PM25 Emissions (in tons)", main = "Total PM25 Emissions (Baltimore)")
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
