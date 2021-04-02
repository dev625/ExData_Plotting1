# Author : Devesh Lohumi
# To Plot : Histogram of Global Active Power


df <- read.delim("../household_power_consumption.txt", header=T, sep=';', na.strings="?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")                        #date is formatted for ease of getting a subset of data

df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))#getting the subset of data

hist(df$Global_active_power,main="Global Active Power",               #plotting the histogram
     xlab = "Global Active Power (kilowatts)",
     ylab="Frequency",col="red")

dev.copy(png, file="plot1.png", height=480, width=480,units="px")     #copying the plot to a png file
dev.off()                                                             #turning off the active device (png file)