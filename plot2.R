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

# Plot 2: Plot 
png("plot2.png")
plot(DateTime, subdata$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()

