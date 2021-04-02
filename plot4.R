# Author : Devesh Lohumi
# To Plot : 4 Different Figures on the same plot 


df <- read.delim("../household_power_consumption.txt", header=T, sep=';', na.strings="?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")                                    #date is formatted for ease of getting a subset of data

df <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))            #getting the subset of data

Date_time <- paste(as.Date(df$Date), df$Time)
df$Date_time <- as.POSIXct(Date_time)

png(filename="plot4.png",height=480,width=480,units = "px")                       #starting the png graphics device

par(mfrow=c(2,2))                                                                 #Subsequent Figures will be drawn in 2x2 array on the device
axis(1, at = c(1, 1200, 1400), labels = c("Thu", "Fri", "Sat"))                   #adding the axis values

#Figure 1
plot(df$Date_time,df$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")

#Figure 2
with(df,plot(df$Date_time,df$Voltage,type="l",xlab="datetime",ylab="Voltage"))

#Figure 3
with(df,plot(Date_time,Sub_metering_1,col="black",type="l",ylab="Energy sub metering",xlab=""))
with(df,points(Date_time,Sub_metering_2,col="red",type="l"))
with(df,points(Date_time,Sub_metering_3,col="blue",type="l"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#Figure 4
with(df,plot(df$Date_time,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()                                                                         #turning off the active device(png file)