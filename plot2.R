##
## Course : Exploratory Data Analysis

## Assignment-1
## Plot-2
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
#
# combine date and time into a single variable
filteredData$DtTime <- ymd_hms(paste(filteredData$Date, filteredData$Time, sep = "_")) ## Format dates and combine Date, Time 

str(filteredData)


## ===== create the graph and save as a PNG file
# graph the data as a line plot
png(filename="plot2.png", width=480, height=480)
plot(filteredData$DtTime, as.numeric(filteredData$Global_active_power), ylab="Global Active Power (kilowatts)", xlab="", type="l", lab=c(3,3,3))
box()
dev.off()


## =====  END OF CODE  ==========================
