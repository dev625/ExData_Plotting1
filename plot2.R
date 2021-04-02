# Author : Devesh Lohumi
# To Plot : Global Active Power vs Days


df <- read.delim("../household_power_consumption.txt", header=T, sep=';', na.strings="?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")                                            #date is formatted for ease of getting a subset of data

df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))                    #getting the subset of data

Date_time <- paste(as.Date(df$Date), df$Time)
df$Date_time <- as.POSIXct(Date_time)                                                     #We use the Date_time object as our independent variable for plotting
png(filename="plot2.png",height=480,width=480,units = "px")                               #starting the png graphics device

plot(df$Date_time,df$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, 1200, 1400), labels = c("Thu", "Fri", "Sat"))                           #adding the axis values
dev.off()                                                                                 #turning off the active device (png file)