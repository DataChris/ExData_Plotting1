##Read in the database, which is unzipped in my directory
PowerConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

##Subset the data to choose only 2/1/2007 and 2/2/2007
PowerDays <- read.table("household_power_consumption.txt", sep=";", na.strings = c("NA", "?"), skip = 66637, nrows = 2880)

##Clean up the naming
names(PowerDays) <- names(PowerConsumption)

##Convert the Date and Time variables to Date/Time classes
date <- paste(PowerDays$Date, PowerDays$Time)
date_time <- strptime(date, "%d/%m/%Y %H:%M:%S")

##Plot 3, set parameters and plot for submetering 1 and add lines for 2 and 3:
par(mfrow=c(1,1))
plot(date_time, PowerDays$Sub_metering_1, type="l",
     xlab="", ylab="Energy submetering", col="black") 
lines(date_time, PowerDays$Sub_metering_2, type="l", col="red")
lines(date_time, PowerDays$Sub_metering_3, type="l", col="blue")

#Create a legend with each kind of data
legend("topright", lty=1, lwd=2, col=c("black","red","blue"), cex=0.95,
       legend=c("Submetering_1", "Submetering_2", "Submetering_3"))

##Save to file
dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()