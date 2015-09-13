# Read the data in
library(lubridate)
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#Subset the dates only to 2007-02-01 and 2007-02-02
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
dfSubsetDates <- df[df$Date >= date1 & df$Date <= date2,]

# Plot the histogram
png("plot1.png")
hist(as.numeric(as.character(dfSubsetDates$Global_active_power)), xlab= "Global Active Power (kilowatts)", ylab="Frequency",main = "Global Active Power", freq=TRUE, col = "red")
dev.off()
