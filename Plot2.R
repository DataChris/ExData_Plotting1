## Read in the database, which is unzipped in my directory
PowerConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

##Subset the data to choose only 2/1/2007 and 2/2/2007
PowerDays <- read.table("household_power_consumption.txt", sep=";", na.strings = c("NA", "?"), skip = 66637, nrows = 2880)

##Clean up the naming
names(PowerDays) <- names(PowerConsumption)

##Plot 2, plot with days indicated
plot(seq(1,2880), PowerDays$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kW)", xaxt = "n")
axis(1, at = c(1, 1440, 2880), labels = c("Thursday", "Friday", "Saturday"))

##Save to file
dev.copy(png, file = "Plot2.png", width = 480, height = 480)
dev.off()
