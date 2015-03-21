### plot4.R
library(dplyr)

# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter for combustion (level 1) & coal (level 4)
filtered <- (grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE) & grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE))
cc <- SCC[filtered,]
coal_emissions <- filter(NEI, SCC %in% cc$SCC)
# sum up emmissions
agg_coal_emissions <- aggregate(Emissions~year, coal_emissions, sum)

# create plot
plot(agg_coal_emissions, type="l", xlab = "Year", ylab = "PM25 Emissions (in tons)", main = "Total Coal Combustion PM25 Emissions")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
