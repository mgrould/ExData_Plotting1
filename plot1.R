# Exploratory data analysis

# Needed library
library(dplyr)

# Load data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir = "./")
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Subset
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Plot 1: Histogram
png("plot1.png")
hist(subdata$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")
dev.off()
