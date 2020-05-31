#R code to create plot4.png

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";", na.strings = "?")

names(data) <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3")

newdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

newdata$Datetime <- as.POSIXct(paste(newdata$Date, newdata$Time), format = "%d/%m/%Y %H:%M:%S")

#Convert the global active power column to numeric
newdata[["Global Active Power"]] <- as.numeric(as.character(newdata[["Global Active Power"]]))

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#first plot
plot(newdata[["Datetime"]], newdata[["Global Active Power"]], type = "l", xlab = "", ylab = "Global Active Power")

#second plot
plot(newdata[["Datetime"]], newdata[["Voltage"]], type = "l", xlab = "datetime", ylab = "Voltage")

#third plot
plot(newdata[["Datetime"]], newdata[["Sub Metering 1"]], type = "l", xlab = "", ylab = "Energy sub metering")

lines(newdata[["Datetime"]], newdata[["Sub Metering 2"]], col = "red")

lines(newdata[["Datetime"]], newdata[["Sub Metering 3"]], col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, box.lty = 0)

#fourth plot
plot(newdata[["Datetime"]], newdata[["Global Reactive Power"]], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
