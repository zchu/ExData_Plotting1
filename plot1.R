#This is for Project 1 of Exploratory Data Analysis

fulldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

fulldata$Time <- strptime(paste(fulldata$Date, fulldata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")


studydata <- subset(fulldata, fulldata$Date >= as.Date(("02/01/2007"), "%m/%d/%Y") & 
                        fulldata$Date <= as.Date(("02/02/2007"), "%m/%d/%Y"))

png("plot1.png", width = 480, height = 480, units = "px")

hist(studydata$Global_active_power,
    main = "Global Active Power",
    xlab = "Global Active Power(killowatts)",
    col = "red",
    breaks = 16
)

dev.off() ## Don't forget to close the PNG device!