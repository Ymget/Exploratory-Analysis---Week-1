# Reading in the data

electricity <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE,  stringsAsFactors = FALSE)
electricity$Date <- as.POSIXct(electricity$Date, format = "%d/%m/%Y")
headers <- names(electricity)

#Subsetting for the dates we need
electricityneeded <- subset(electricity, Date >= as.POSIXct('2007-02-01') & Date <= as.POSIXct('2007-02-02'),  stringsAsFactors = FALSE)
names(electricityneeded) <- headers

#Creating this plot
plot(electricityneeded$Sub_metering_1, typ = "l", xaxt="n", ylab = "Energy Sub Metering", xlab = "")
lines(electricityneeded$Sub_metering_2, col="red")
lines(electricityneeded$Sub_metering_3, col="blue")
axis(side=1, at=z, labels = c("Thur", "Fri", "Sat"))
legend("topright", lty = c(1,1,1), col = c("blue", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#OUtputting the plot to png file
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(electricityneeded$Sub_metering_1, typ = "l", xaxt="n", ylab = "Energy Sub Metering", xlab = "")
lines(electricityneeded$Sub_metering_2, col="red")
lines(electricityneeded$Sub_metering_3, col="blue")
axis(side=1, at=z, labels = c("Thur", "Fri", "Sat"))
legend("topright", lty = c(1,1,1), col = c("blue", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()






