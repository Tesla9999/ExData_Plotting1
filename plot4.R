
# please use setwd() to set your work directory, make sure the needed datafile is inside
# the following code will do:
# open and read the data file "household_power_consumption.txt"
# subset the data from 2007-02-01 to 2007-02-02
# convert the date/time to system time format and add one more column to data


filename <- 'household_power_consumption.txt'
df <- read.table(filename, sep = ';', header = TRUE, quote = "", na.strings = "?", stringsAsFactors = FALSE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
data <- df[df$Date >= '2007-02-01' & df$Date <= '2007-02-02',]
rm(df)
Datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(Datetime)

#make plot 4 and write it to plot4.png
#split the window to 2x2 for 4 plots
par(mfrow = c(2,2))
#plot 1
plot(data$Datetime, data$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')
#plot 2
plot(data$Datetime, data$Voltage, type = 'l',  xlab = 'datetime', ylab = 'Voltage')
#plot 3
plot(data$Datetime, data$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering', col = 'black')
lines(data$Datetime, data$Sub_metering_2, col = 'red')
lines(data$Datetime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n', cex = 0.9, y.intersp=0.5)
#plot 4
plot(data$Datetime, data$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power', ylim = c(0, 0.5))
# write to png
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()



