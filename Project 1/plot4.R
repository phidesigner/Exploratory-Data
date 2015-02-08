# To run this script, ensure "household_power_consumption.txt" 
# is in your working directory
# load data from Working directory
power.all <- read.table("household_power_consumption.txt",
                        header=TRUE,sep=";",na.strings="?")

# Convert Data column to Data class
power.all$Date<-as.Date(power.all$Date,format="%d/%m/%Y")

# Subset from dates 2007-02-01 to 2007-02-02
power<-subset(power.all,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power.all)

# New column linking Dates with times for linear plots' required higher detail
power$Date_time<-as.POSIXct(Date_time<-with(power,paste(Date,Time)))
rm(Date_time)

#Save to PNG
dev.copy(png,file="plot4.png",480,480)

# Draw linear Plot

par(mfrow=c(2,2), mar=c(4,4,4,4), oma=c(0,0,2,0))
with(power, {
  plot(Date_time, Global_active_power,type="l", 
       ylab="Global Active Power", xlab="")
  plot(Date_time, Voltage, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Date_time, Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Date_time,Sub_metering_2,col='Red')
  lines(Date_time,Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, cex=.7,
         legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
  plot(Date_time, Global_reactive_power, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})

# Close graphic devise

dev.off()
