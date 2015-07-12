source("load_data.R")

## Coursera: Exploratory Data Analysis
## Course Project 1: Plot 2
## Jonathan Labin
## 2015-07-11

# Uncomment the following to download the data from the internet.
#obtainData()

# Comment out the following line if the data has already been read
data <- loadData()

# Open the output file for writing
png(file = "plot2.png", width=480,height=480,units="px",bg = "transparent")

# Set up the plot without data
plot(data$DateTime, data$Global_active_power, 
     xlab="", ylab="Global Active Power (kilowatts)", 
     type = "n")

# Add the line for the data
lines(data$DateTime, data$Global_active_power)

# Close the png file
dev.off()