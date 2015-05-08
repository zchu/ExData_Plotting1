fulldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")
#fulldata$Time <- strptime(fulldata$Time, "%H:%M:%S")

fulldata$Time <- strptime(paste(fulldata$Date, fulldata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")


studydata <- subset(fulldata, fulldata$Date >= as.Date(("02/01/2007"), "%m/%d/%Y") & 
                        fulldata$Date <= as.Date(("02/02/2007"), "%m/%d/%Y"))

png("plot2.png", width = 480, height = 480, units = "px")


plot(studydata$Time, studydata$Global_active_power,
     ylab = "Global Active Power (killowatts)",
     xlab = "",
     type = "l"
     )



#dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
