y_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(my_url,'the data.zip')
x <- read.table(unz('the data.zip','household_power_consumption.txt'),header = T,sep = ';')
first_day <- x$Date == "1/2/2007"
second_day <- x$Date == "2/2/2007"
date_range <- first_day | second_day
y <- x[date_range,]
y$Date <- as.Date(y$Date,format = "%d/%m/%Y")
y$Global_active_power <- as.numeric(y$Global_active_power)
hist(y$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()