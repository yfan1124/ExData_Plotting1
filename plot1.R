setwd("C:/Users/y2l/Dropbox/Coursera/Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
z = paste(data[,1],data[,2],sep = ' ')
x <- as.Date(z, format = '%d/%m/%Y %H:%M:%S')
data[,1] <- x
datasubset <- subset(data, data$Date == "2007-02-01")
datasubset <- rbind(datasubset, subset(data, data$Date == "2007-02-02"))

png("plot1.png", width=480, height=480)
hist(datasubset$Global_active_power, col="red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()