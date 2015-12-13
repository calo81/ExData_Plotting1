if(!file.exists("./data/dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/dataset.zip")
}
fromFile <-  unz("./data/dataset.zip", "household_power_consumption.txt")
data <- read.table(fromFile, sep = ";", header = TRUE)
forDate <- data[as.Date(data$Date, "%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(data$Date, "%d/%m/%Y") <= as.Date('2007-02-02'), ]
png("./plot1.png")
hist(as.double(as.character(forDate$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
