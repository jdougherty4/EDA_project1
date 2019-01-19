library(readr)
library(lubridate)
library(dplyr)

data <- read_delim("household_power_consumption.txt", delim = ";")

#table(problems(read_delim("household_power_consumption.txt", delim = ";"))$actual)

data$Date <- dmy(data$Date)
head(data$Date)
data_filtered <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png("plot3.png", width=480, height=480)

plot(data_filtered$datetime, as.numeric(data_filtered$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")

lines(data_filtered$datetime, as.numeric(data_filtered$Sub_metering_2), type="l", col="red")

lines(data_filtered$datetime, as.numeric(data_filtered$Sub_metering_3), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
