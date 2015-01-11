y_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(my_url,'the data.zip')
x <- read.table(unz('the data.zip','household_power_consumption.txt'),header = T,sep = ';')
first_day <- x$Date == "1/2/2007"
second_day <- x$Date == "2/2/2007"
date_range <- first_day | second_day
y <- x[date_range,]
y$Date <- as.Date(y$Date,format = "%d/%m/%Y")
y$Global_active_power <- as.numeric(y$Global_active_power)
y$Voltage <- as.numeric(y$Voltage)
y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)
y$Global_reactive_power <- as.numeric(y$Global_reactive_power)
plot(y$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
plot(y$Voltage,ylab = 'Voltage', xlab = 'datetime', type = 'l')
plot(y$Sub_metering_1, type = 'l', ylab = 'Energy sub metering')
lines(y$Sub_metering_2, col = 'red')
lines(y$Sub_metering_3, col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = c(1,1), col = c('black','red','blue'), cex = .5)
plot(y$Global_reactive_power, type = 'l', ylab = 'Global Reactive Power', xlab = 'datetime')
dev.copy(png,"plot4.png")
dev.off()