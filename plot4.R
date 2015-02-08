# Data Load
household_power_consumption <- read.csv("household_power_consumption.txt",
                                        sep=";",
                                        na.strings = "?")

data <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") &
                                        as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),]

# Plot
png("plot4.png")
par(mfrow=c(2,2))

# topleft
plot(x = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S"),
     y = data$Global_active_power,
     ylab = "Global Active Power",
     xlab = "",
     type="l")

#topright
plot(x = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S"),
     y = data$Voltage,
     ylab = "Voltage",
     xlab = "datetime",
     type="l")

#bottomleft
plot(x = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S"),
     y = data$Sub_metering_1,
     ylim = c(0,38),
     ylab = "Energy sub metering",
     xlab = "",
     type="l")
par(new=T)
plot(x = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S"),
     y = data$Sub_metering_2,
     ylim = c(0,38),
     ylab = "",
     xlab = "",
     type="l",
     col = "red")
par(new=T)
plot(x = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S"),
     y = data$Sub_metering_3,
     ylim = c(0,38),
     ylab = "",
     xlab = "",
     type="l",
     col = "blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       lwd = c(1,1,1),col=c("black","red","blue"))
par(new=F)

#bottomright
plot(x = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S"),
     y = data$Global_reactive_power,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type="l")

dev.off()