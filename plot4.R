if(!file.exists("./data/dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/dataset.zip")
}
fromFile <-  unz("./data/dataset.zip", "household_power_consumption.txt")
data <- read.table(fromFile, sep = ";", header = TRUE)
forDate <- data[as.Date(data$Date, "%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(data$Date, "%d/%m/%Y") <= as.Date('2007-02-02'), ]
forDate$Timestamp <- NA
forDate$Timestamp <- paste(forDate$Date, forDate$Time, sep = " ")
png("./plot4.png")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))


plot(strptime(forDate$Timestamp, format = "%d/%m/%Y %H:%M:%S"), as.double(as.character(forDate$Global_active_power)), type = "l", ann=FALSE)
title(ylab="Global Active Power")


plot(strptime(forDate$Timestamp, format = "%d/%m/%Y %H:%M:%S"), as.double(as.character(forDate$Voltage)), type = "l", ann=FALSE)
title(ylab="Voltage", xlab = "datetime")


plot(strptime(forDate$Timestamp, format = "%d/%m/%Y %H:%M:%S"), as.double(as.character(forDate$Sub_metering_1)), type = "l", ann=FALSE)
points(strptime(forDate$Timestamp, format = "%d/%m/%Y %H:%M:%S"), as.double(as.character(forDate$Sub_metering_2)), type = "l", ann=FALSE, col = "red")
points(strptime(forDate$Timestamp, format = "%d/%m/%Y %H:%M:%S"), as.double(as.character(forDate$Sub_metering_3)), type = "l", ann=FALSE, col = "blue")
title(ylab="Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1), bty = "n")


plot(strptime(forDate$Timestamp, format = "%d/%m/%Y %H:%M:%S"), as.double(as.character(forDate$Global_reactive_power)), type = "l", ann=FALSE)
title(ylab="Global_reactive_power", xlab = "datetime")

dev.off()