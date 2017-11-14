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

# Plot 3: Plot 
png("plot3.png")
plot(DateTime, subdata$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
lines(DateTime, subdata$Sub_metering_2,
      type = "l",
      col = "red")
lines(DateTime, subdata$Sub_metering_3,
      type = "l",
      col = "blue")
legend("topright", lty = "solid", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

