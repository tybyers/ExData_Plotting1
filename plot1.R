# Tyler Byers
# plot1.R
# For Coursera EDA course
# 10 July 2014

# Read data from file
power <- read.csv('data/household_power_consumption.txt', sep = ';')

# Subset data two first two days of Feb 2007; dd/mm/yyyy format
powersub <- subset(power, Date ==  '1/2/2007' | Date == '2/2/2007')

# Global Active Power is a factor variable.  Change it to a numerical variable.
powersub$Global_active_power <- 
    as.numeric(as.character(powersub$Global_active_power))

# Draw Plot
png('plot1.png', height = 480, width = 480)
hist(powersub$Global_active_power, col = c('red'), fg = c('black'),
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)',
     axes = F) 
axis(1, at = c(0, 2, 4, 6))
axis(2, at = c(0, 200, 400, 600, 800, 1000, 1200))
dev.off()
