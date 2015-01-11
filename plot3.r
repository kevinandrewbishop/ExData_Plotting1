y_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(my_url,'the data.zip')
x <- read.table(unz('the data.zip','household_power_consumption.txt'),header = T,sep = ';')
first_day <- x$Date == "1/2/2007"
second_day <- x$Date == "2/2/2007"
date_range <- first_day | second_day
y <- x[date_range,]
y$Date <- as.Date(y$Date,format = "%d/%m/%Y")
y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)
plot(y$Sub_metering_1, type = 'l', ylab = 'Energy sub metering')
lines(y$Sub_metering_2, col = 'red')
lines(y$Sub_metering_3, col = 'blue')
legend(2000,35,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = c(1,1), col = c('black','red','blue'))
dev.copy(png,"plot3.png")
dev.off()