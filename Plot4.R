##Read in the database, which is unzipped in my directory
PowerConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

##Subset the data to choose only 2/1/2007 and 2/2/2007
PowerDays <- read.table("household_power_consumption.txt", sep=";", na.strings = c("NA", "?"), skip = 66637, nrows = 2880)

##Clean up the naming
names(PowerDays) <- names(PowerConsumption)

##Convert the Date and Time variables to Date/Time classes
date <- paste(PowerDays$Date, PowerDays$Time)
date_time <- strptime(date, "%d/%m/%Y %H:%M:%S")

##Make two rows and two columns
par(mfrow=c(2,2))

##Create the first plot 
plot(date_time, PowerDays$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kW)")
axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

##Plot the voltage:
plot(date_time, PowerDays$Voltage, type="l", ylab="Voltage", xaxt = "n")
axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

##Use code from Plot3:
plot(date_time, PowerDays$Sub_metering_1, type="l",
     xlab="", ylab="Energy submetering", col="black") 
lines(date_time, PowerDays$Sub_metering_2, type="l", col="red")
lines(date_time, PowerDays$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), cex=0.25,
       legend=c("Submetering_1", "Submetering_2", "Submetering_3"))


##Plot the global reactive power
plot(date_time, PowerDays$Global_reactive_power, cex=0.95, type="l", 
     ylab="Global_reactive_power", xaxt="n")
axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

##Save to file
dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()