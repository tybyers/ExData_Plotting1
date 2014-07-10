# Tyler Byers
# plot2.R
# For Coursera EDA course
# 10 July 2014

# Read data from file
power <- read.csv('data/household_power_consumption.txt', sep = ';')

# Subset data two first two days of Feb 2007; dd/mm/yyyy format
powersub <- subset(power, Date ==  '1/2/2007' | Date == '2/2/2007')

# Global Active Power is a factor variable.  Change it to a numerical variable.
powersub$Global_active_power <- 
    as.numeric(as.character(powersub$Global_active_power))

# Create a date-time variable
powersub$DateTime <- strptime(paste(as.character(powersub$Date), 
                                    as.character(powersub$Time)), 
                              '%d/%m/%Y %H:%M:%S')

# Draw Plot
png('plot2.png', height = 480, width = 480, bg = 'transparent')
with(powersub, plot(DateTime, Global_active_power, type = 'l',
                    ylab = 'Global Active Power (kilowatts)',
                    xlab = ''))

dev.off()
