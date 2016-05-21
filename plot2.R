
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

#make plot 2 and write it to plot1.png

plot(data$Datetime, data$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

