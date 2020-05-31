#R code to create plot3.png

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";", na.strings = "?")

names(data) <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3")

newdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

newdata$Datetime <- as.POSIXct(paste(newdata$Date, newdata$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)

plot(newdata[["Datetime"]], newdata[["Sub Metering 1"]], type = "l", xlab = "", ylab = "Energy sub metering")

lines(newdata[["Datetime"]], newdata[["Sub Metering 2"]], col = "red")

lines(newdata[["Datetime"]], newdata[["Sub Metering 3"]], col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()
