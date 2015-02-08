# Data Load
household_power_consumption <- read.csv("household_power_consumption.txt",
                                        sep=";",
                                        na.strings = "?")

data <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") &
                                        as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),]

# Plot
png("plot3.png")

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

dev.off()