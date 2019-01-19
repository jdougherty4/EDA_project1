library(readr)
library(lubridate)
library(dplyr)

#memory allocation
2075259 * 9 * 8
#149418648 bytes 
data <- read_delim("household_power_consumption.txt", delim = ";")

#table(problems(read_delim("household_power_consumption.txt", delim = ";"))$actual)

data$Date <- dmy(data$Date)
head(data$Date)
data_filtered <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png("plot1.png", width=480, height=480)

hist(data_filtered$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
