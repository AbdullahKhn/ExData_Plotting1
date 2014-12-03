# load libraries
library(data.table)
library(lubridate)

# read from source file limiting only to the specified dates
var_class <- c(rep('character',2),rep('numeric',7))
pwr.cmp <- read.table('household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?',colClasses = var_class)                                
pwr.cmp <- pwr.cmp[pwr.cmp$Date == '1/2/2007' | pwr.cmp$Date == '2/2/2007',]

# cleaning the variable names
pwr.cmp$DateTime <- dmy(pwr.cmp$Date) + hms(pwr.cmp$Time)
pwr.cmp <- pwr.cmp[,c(10,3:9)]
  
# creating plot 3
png('plot3.png',width = 480,height = 480,units = 'px')

line_color <- c('black','red','blue')
line_lbls <- c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(pwr.cmp$DateTime, pwr.cmp$Sub_metering_1, type = 'l', col = 'black', xlab = '', ylab = 'Energy sub metering')
lines(pwr.cmp$DateTime, pwr.cmp$Sub_metering_2, col = 'red')
lines(pwr.cmp$DateTime, pwr.cmp$Sub_metering_3, col = 'blue')
legend('topright', legend = line_lbls, col = line_color, lty = 'solid')

# Close off graphic device
x <- dev.off()
