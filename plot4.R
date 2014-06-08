##
## Course : Exploratory Data Analysis

## Assignment-1
## Plot-4
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
# graph the data as 2 rows of 2 graphs per row
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(5, 4, 4, 2) + 0.1)
# row-1, plot-1
plot(filteredData$DtTime, as.numeric(filteredData$Global_active_power), ylab="Global Active Power (kilowatts)", xlab="", type="l", lab=c(3,3,3))
box()
#row-1, plot-2
plot(filteredData$DtTime, as.numeric(filteredData$Voltage), ylab="Voltage", xlab="datetime", type="l")
#row-2, plot-1
plot(filteredData$DtTime, as.numeric(filteredData$Sub_metering_1), ylab="Energy sub metering", xlab="", type="l", lab=c(3,3,3))
lines(filteredData$DtTime, as.numeric(filteredData$Sub_metering_2), ylab="Energy sub metering", xlab="", type="l", lab=c(3,3,3), col="red")
lines(filteredData$DtTime, as.numeric(filteredData$Sub_metering_3), ylab="Energy sub metering", xlab="", type="l", lab=c(3,3,3), col="blue")
box()
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
#row-2, plot-2
plot(filteredData$DtTime, as.numeric(filteredData$Global_reactive_power), ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()

# set par back to normal
par(mfrow=c(1,1))


## =====  END OF CODE  ==========================
