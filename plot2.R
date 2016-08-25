#Dependancies
install.packages("chron")
library(chron)

# Reading in the data

electricity <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE,  stringsAsFactors = FALSE)
electricity$Date <- as.POSIXct(electricity$Date, format = "%d/%m/%Y")
electricity$Time <- chron(times. = electricity$Time)
headers <- names(electricity)

#Subsetting for the dates we need
electricityneeded <- subset(electricity, Date >= as.POSIXct('2007-02-01') & Date <= as.POSIXct('2007-02-02'),  stringsAsFactors = FALSE)
names(electricityneeded) <- headers

#Creating this plot
plot(electricityneeded$Global_active_power, typ = "l", xaxt="n", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(side=1, at=z, labels = c("Thur", "Fri", "Sat"))

#OUtputting the plot to png file
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(electricityneeded$Global_active_power, typ = "l", xaxt="n", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(side=1, at=z, labels = c("Thur", "Fri", "Sat"))
dev.off()