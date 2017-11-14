# Exploratory data analysis

# Needed library
library(dplyr)

# Get English dates instead of French
Sys.setlocale("LC_TIME","en_US.UTF-8")

# Load data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir = "./")
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Subset
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
DateTime <- strptime(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 4: Plot 
png("plot4.png")
par(mfrow = c(2,2))
plot(DateTime, subdata$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power",
     type = "l")
plot(DateTime, subdata$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")
plot(DateTime, subdata$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
lines(DateTime, subdata$Sub_metering_2, type = "l", col = "red")
lines(DateTime, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", col=c("black", "red", "blue"), bty="n")
plot(DateTime, subdata$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")
dev.off()

