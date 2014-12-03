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
  
# creating plot 1
png('plot1.png',width = 480,height = 480,units = 'px')
hist(pwr.cmp$Global_active_power, main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)',col = 'red')

# Close off graphic device
x<-dev.off()
