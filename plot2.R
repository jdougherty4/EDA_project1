library(readr)
library(lubridate)
library(dplyr)
 
data <- read_delim("household_power_consumption.txt", delim = ";")

#table(problems(read_delim("household_power_consumption.txt", delim = ";"))$actual)

data$Date <- dmy(data$Date)
head(data$Date)
data_filtered <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png("plot2.png", width=480, height=480)

data_filtered$datetime <- strptime(paste(data_filtered$Date, data_filtered$Time), "%Y-%m-%d %H:%M:%S")

plot(data_filtered$datetime, data_filtered$Global_active_power,
     type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
