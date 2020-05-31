#R code to create plot1.png

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

names(data) <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3")

newdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#convert the column values to numeric
newdata[["Global Active Power"]] <- as.numeric(as.character(newdata[["Global Active Power"]]))

png(file = "plot1.png", width = 480, height = 480)

hist(newdata[["Global Active Power"]], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
