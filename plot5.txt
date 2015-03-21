### plot5.R
library(dplyr)

# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter for baltimore motor vehicles
baltimore <- filter(NEI, fips == "24510")
vehicles <- filter(SCC, grepl("vehicle", Short.Name, ignore.case = TRUE))
baltimore_vehicles <- filter(baltimore, SCC %in% vehicles$SCC)

# sum up emmissions
agg_emissions <- aggregate(Emissions~year, baltimore_vehicles, sum)

# create plot
plot(agg_emissions, type="l", xlab = "Year", ylab = "PM25 Emissions (in tons)", main = "Total Baltimore Vehicles PM25 Emissions")
dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()
