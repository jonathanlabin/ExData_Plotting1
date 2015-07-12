source("load_data.R")

## Coursera: Exploratory Data Analysis
## Course Project 1: Plot 4
## Jonathan Labin
## 2015-07-11

# Uncomment the following to download the data from the internet.
#obtainData()

# Comment out the following line if the data has already been read
data <- loadData()


chart_global_active_power <- function(){
    
    # Set up the plot without data
    plot(data$DateTime, data$Global_active_power, 
         xlab="", ylab="Global Active Power", 
         type = "n")
    
    # Add the line for the data
    lines(data$DateTime, data$Global_active_power)
    
}

chart_voltage <- function(){
    
    # Set up the plot without data
    plot(data$DateTime, data$Voltage, 
         xlab="datetime", ylab="Voltage", 
         type = "n")
    
    # Add the line for the data
    lines(data$DateTime, data$Voltage)
    
}

chart_energy_sub_metering <- function() {
    # Set up the plot without data
    plot(data$DateTime, data$Sub_metering_1, 
         xlab="", ylab="Energy sub metering", 
         type = "n")
    
    # Add the line for the data
    lines(data$DateTime, data$Sub_metering_1, col="black")
    lines(data$DateTime, data$Sub_metering_2, col="red")
    lines(data$DateTime, data$Sub_metering_3, col="blue")
    
    # Create the legend
    legend("topright", lty=c(1,1), bty="n",
           col = c("black", "red", "blue"),
           legend = colnames(data)[6:8])
}

chart_global_reactive_power <- function(){
    
    # Set up the plot without data
    plot(data$DateTime, data$Global_reactive_power, 
         xlab="datetime", ylab="Global_reactive_power", 
         type = "n")
    
    # Add the line for the data
    lines(data$DateTime, data$Global_reactive_power)   
}

draw_four_charts <- function(){
    # Open the output file for writing
    png(file = "plot4.png", width=504,height=504,units="px",bg = "transparent") #, type="cairo")
    
    # Set up 
    par(mfrow = c(2, 2), mar = c(5, 4, 3, 2), oma = c(0, 0, 0, 0))
    
    chart_global_active_power()
    chart_voltage()
    chart_energy_sub_metering()
    chart_global_reactive_power()
    
    # Close the png file
    dev.off()
}

draw_four_charts()