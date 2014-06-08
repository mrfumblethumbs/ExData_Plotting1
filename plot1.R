##
## Course : Exploratory Data Analysis

## Assignment-1
## Plot-1
##
## prepared by : Brian Greiner
##
##

## ===== set working directory
setwd("C:/Coursera/Exploratory Data Analysis/Assignment-1")

## ==== load libraries
library(lubridate)


## ===== load data, convert dates to POSIXlt form, create subset for the required 2 dates
thisData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
head(thisData)
str(thisData)
# convert times to POSIXlt
dateData <- thisData$Date
thisData$Date <- strptime(dateData, "%d/%m/%Y", tz="")
filteredData <- subset(thisData, Date >= as.POSIXlt("2007-02-01") & Date <= as.POSIXlt("2007-02-02"))


## ===== create the graph and save as a PNG file
# graph the data as a histogram
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(filteredData$Global_active_power)/1000, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()


## =====  END OF CODE  ==========================
