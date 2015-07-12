source("load_data.R")

## Coursera: Exploratory Data Analysis
## Course Project 1: Plot 1
## Jonathan Labin
## 2015-07-11

# Uncomment the following to download the data from the internet.
#obtainData()

# Comment out the following line if the data has already been read
data <- loadData()

# Open the output file for writing
png(file = "plot1.png", width=480,height=480,units="px",bg = "transparent")
hist(data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()