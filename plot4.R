fulldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

fulldata$Time <- strptime(paste(fulldata$Date, fulldata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")

studydata <- subset(fulldata, fulldata$Date >= as.Date(("02/01/2007"), "%m/%d/%Y") & 
                        fulldata$Date <= as.Date(("02/02/2007"), "%m/%d/%Y"))



png("plot4.png", width = 480, height = 480, units = "px")


par(mfrow = c(2, 2))

plot(studydata$Time, studydata$Global_active_power,
     ylab = "Global Active Power",
     xlab = "",
     type = "l")

plot(studydata$Time, studydata$Voltage,
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")


plot(studydata$Time, studydata$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab = "",
     type = "l",
     col = "black"
)

with(studydata, lines(Time, Sub_metering_2, col = "red"))
with(studydata, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(studydata$Time, studydata$Global_reactive_power,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")

dev.off()
