# Data Load
household_power_consumption <- read.csv("household_power_consumption.txt",
                                        sep=";",
                                        na.strings = "?")

data <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") &
                                    as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),]

# Plot
png("plot1.png")
hist(x = data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

