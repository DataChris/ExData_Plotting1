## Read in the database to PowerConsumption, which is unzipped in my directory
PowerConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

##Subset the data for 2/1/2007 and 2/2/2007 into PowerDays; I found the first row number and number of rows 
##using Excel, which was an interesting import experience.
PowerDays <- read.table("household_power_consumption.txt", sep=";", na.strings = c("NA", "?"), 
                        skip = 66637, nrows = 2880)

##Clean up the naming
names(PowerDays) <- names(PowerConsumption)

##Plot 1, generate histogram
hist(PowerDays$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kW)", 
     ylab = "Frequency", col = "red")

## Save to PNG file with width and height of 480 pixels
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()
