#R code to create plot2.png

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";", na.strings = "?")

names(data) <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3")

newdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Convert the global active power column to numeric
newdata[["Global Active Power"]] <- as.numeric(as.character(newdata[["Global Active Power"]]))

newdata$Datetime <- as.POSIXct(paste(newdata$Date, newdata$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)

plot(newdata[["Datetime"]], newdata[["Global Active Power"]], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
