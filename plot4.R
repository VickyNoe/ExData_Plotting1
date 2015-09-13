# Read the data in
library(lubridate)
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#Subset the dates only to 2007-02-01 and 2007-02-02
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
dfSubsetDates <- df[df$Date >= date1 & df$Date <= date2,]

png("plot4.png")

# Set up the plot window with the par command
par(mfrow=c(2,2))

# Plot the data

plot(datesAndTimes,as.numeric(as.character(dfSubsetDates$Global_active_power)),
     ylab="Global Active Power (kilowatts)", xlab="", type="l")
plot(datesAndTimes,as.numeric(as.character(dfSubsetDates$Voltage)),
     ylab="Voltage", xlab="datetime", type="l")
plot(datesAndTimes,as.numeric(as.character(dfSubsetDates$Sub_metering_1)),
     ylab="Energy sub metering", xlab="", type="l")
lines(datesAndTimes,as.numeric(as.character(dfSubsetDates$Sub_metering_2)), col="red", type="l")
lines(datesAndTimes,as.numeric(as.character(dfSubsetDates$Sub_metering_3)), col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1,bty="n",col=c("black","red","blue"))
plot(datesAndTimes,as.numeric(as.character(dfSubsetDates$Global_reactive_power)), 
     ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()