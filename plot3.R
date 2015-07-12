source("load_data.R")

## Coursera: Exploratory Data Analysis
## Course Project 1: Plot 3
## Jonathan Labin
## 2015-07-11

# Uncomment the following to download the data from the internet.
#obtainData()

# Comment out the following line if the data has already been read
data <- loadData()

# Open the output file for writing
png(file = "plot3.png", width=480,height=480,units="px",bg = "transparent")

# Set up the plot without data
plot(data$DateTime, data$Sub_metering_1, 
     xlab="", ylab="Energy sub metering", 
     type = "n")

# Add the line for the data
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

# Create the legend
legend("topright", lty=c(1,1),
       col = c("black", "red", "blue"),
       legend = colnames(data)[6:8])

# Close the png file
dev.off()