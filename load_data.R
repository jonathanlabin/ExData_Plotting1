## Coursera: Exploratory Data Analysis
## Course Project 1: Load Data Script
## Jonathan Labin
## 2015-07-11

## This script works with data from the UC Irvine Machine Learning Repository
## located at: http://archive.ics.uci.edu/ml/
## Specifically the Electric power consumption data set which is described as:
## 
##  Measurements of electric power consumption in one household with a 
##  one-minute sampling rate over a period of almost 4 years. Different
##  electrical quantities and some sub-metering values are available.
##
## These functions operate over the data from this data set between:
##   2007-02-01 and 2007-02-02

## Downloads the raw data specified for this project.
## The data is downoaded as a zip file in the working directory, 
## unzipped and then removed leaving only the contents of the zip 
## in the working directory.
obtainData <- function(
        URL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"){
    zipFileName = "exdata-household_power_consumption.zip"
    
    # download the file
    download.file(URL, zipFileName)
    unzip(zipFileName)
    unlink(zipFileName)
}

loadData <- function(filename="household_power_consumption.txt",
                     start_at="2007-02-01", end_at="2007-02-02") {
    # Create a date object representing the earliest date interested in
    start_on <- as.Date(start_at, format="%Y-%m-%d")
    # Create a date object representing the last date interested in
    end_on <- as.Date(end_at, format="%Y-%m-%d")
    
    # Read data from file
    # TODO: switch to loading only data we want
    data <- read.table(filename, na.strings="?", header = TRUE, sep = ";", 
                       colClasses=c("character","character",rep("numeric",7)))
    
    # Create a column that is the combined date and time
    data$DateTime <- strptime(paste(data$Date, data$Time), 
                              format="%d/%m/%Y %H:%M:%S")
    
    # rearange columns and remove original character Date and Time columns
    data <- data[,c(ncol(data),3:9)]
    
    # reduce down to only the rows that are within the range interested in
    data <- data[!is.na(data$DateTime) 
                 & as.Date(data$DateTime) >= start_on 
                 & as.Date(data$DateTime) <= end_on,]
    
    # return the resulting data frame
    data
}


