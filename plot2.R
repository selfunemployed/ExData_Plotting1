# Data Load
household_power_consumption <- read.csv("household_power_consumption.txt",
                                        sep=";",
                                        na.strings = "?")

data <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") &
                                        as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),]

# Plot
png("plot2.png")
plot(x = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S"),
     y = data$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="l")
dev.off()