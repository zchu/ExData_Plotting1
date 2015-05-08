fulldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

fulldata$Time <- strptime(paste(fulldata$Date, fulldata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")

studydata <- subset(fulldata, fulldata$Date >= as.Date(("02/01/2007"), "%m/%d/%Y") & 
                        fulldata$Date <= as.Date(("02/02/2007"), "%m/%d/%Y"))


png("plot3.png", width = 480, height = 480, units = "px")


plot(studydata$Time, studydata$Sub_metering_1,
      ylab = "Energy sub metering",
      xlab = "",
      type = "l",
      col = "black"
 )

with(studydata, lines(Time, Sub_metering_2, col = "red"))
with(studydata, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

# 
# plot(studydata$Time, studydata$Sub_metering_2,
#      ylab = "Energy sub metering",
#      xlab = "",
#      type = "l",
#      col = "red"
# )
