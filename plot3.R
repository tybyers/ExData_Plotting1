# Tyler Byers
# plot3.R
# For Coursera EDA course
# 10 July 2014

# Read data from file
power <- read.csv('data/household_power_consumption.txt', sep = ';')

# Subset data two first two days of Feb 2007; dd/mm/yyyy format
powersub <- subset(power, Date ==  '1/2/2007' | Date == '2/2/2007')

# Global Active Power is a factor variable.  Change it to a numerical variable.
powersub$Global_active_power <- 
    as.numeric(as.character(powersub$Global_active_power))

# Make all three sub_metering variables numerical variables
powersub$Sub_metering_1 <- 
    as.numeric(as.character(powersub$Sub_metering_1))
powersub$Sub_metering_2 <- 
    as.numeric(as.character(powersub$Sub_metering_2))
powersub$Sub_metering_3 <- 
    as.numeric(as.character(powersub$Sub_metering_3))

# Create a date-time variable
powersub$DateTime <- strptime(paste(as.character(powersub$Date), 
                                    as.character(powersub$Time)), 
                              '%d/%m/%Y %H:%M:%S')

# Draw Plot
png('plot3.png', height = 480, width = 480, bg = 'transparent')
with(powersub, plot(DateTime, Sub_metering_1, type = 'l', col = 'black',
                    ylab = 'Energy sub metering',
                    xlab = ''))
with(powersub, lines(DateTime, Sub_metering_2, col = 'red'))
with(powersub, lines(DateTime, Sub_metering_3, col = 'blue'))
legend('topright', col = c('black', 'red', 'blue'), lty = 1, 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
