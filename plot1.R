# Reading in the data

electricity <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE,  stringsAsFactors = FALSE)
electricity$Date <- as.POSIXct(electricity$Date, format = "%d/%m/%Y")
headers <- names(electricity)

#Subsetting for the dates we need
electricityneeded <- subset(electricity, Date >= as.POSIXct('2007-02-01') & Date <= as.POSIXct('2007-02-02'),  stringsAsFactors = FALSE)
names(electricityneeded) <- headers

#Creating this plot
hist(electricityneeded$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#OUtputting the plot to png file
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(electricityneeded$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()