# Author : Devesh Lohumi
# To Plot : All the 3 sub metering readings vs days


df <- read.delim("../household_power_consumption.txt", header=T, sep=';', na.strings="?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")#date is formatted for ease of getting a subset of data

df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))#getting the subset of data

Date_time <- paste(as.Date(df$Date), df$Time)
df$Date_time <- as.POSIXct(Date_time)

with(df,plot(Date_time,Sub_metering_1,col="black",type="l",ylab="Energy sub metering",xlab=""))
with(df,points(Date_time,Sub_metering_2,col="red",type="l"))
with(df,points(Date_time,Sub_metering_3,col="blue",type="l"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, at = c(1, 1200, 1400), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file="plot3.png", height=480, width=480,units="px") #copying the plot to a png file
dev.off()