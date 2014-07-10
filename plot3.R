setwd("C:/Users/y2l/Dropbox/Coursera/Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
z = paste(data[,1],data[,2],sep = ' ')
DateTime <- strptime(z, format = '%d/%m/%Y %H:%M:%S')
data <- cbind(data, DateTime)

x <- as.Date(z, format = '%d/%m/%Y %H:%M:%S')
data[,1] <- x
datasubset <- subset(data, data$Date == "2007-02-01")
datasubset <- rbind(datasubset, subset(data, data$Date == "2007-02-02"))

png("plot3.png", width=480, height=480)
with(datasubset, plot(datasubset$DateTime, as.numeric(datasubset$Sub_metering_1), type = "n", xlab = "", ylab = "Energy sub metering"))
with(datasubset, plot(datasubset$DateTime, as.numeric(datasubset$Sub_metering_1), col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
lines(datasubset$DateTime, as.numeric(datasubset$Sub_metering_2), col = "red")
lines(datasubset$DateTime, as.numeric(datasubset$Sub_metering_3), col = "blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()
