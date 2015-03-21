### plot1.R

# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# sum up emmissions
total <- aggregate(Emissions~year, NEI, sum)

# create plot
plot(total, type="l", xlab = "Year", ylab = "PM25 Emissions (in tons)", main = "Total PM25 Emissions (US)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
