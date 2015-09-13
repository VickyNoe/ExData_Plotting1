# Read the data in
library(lubridate)
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
#Subset the dates only to 2007-02-01 and 2007-02-02
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
dfSubsetDates <- df[df$Date >= date1 & df$Date <= date2,]

#Construct a column that contains the date and time together
dateTimes <- paste(dfSubsetDates$Date,dfSubsetDates$Time)
datesAndTimes <- ymd_hms(dateTimes)


# Plot the data
png("plot2.png")
plot(datesAndTimes,as.numeric(as.character(dfSubsetDates$Global_active_power)),
     ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()