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

# Draw histogram
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (KWs)")

# Save to PNG
dev.copy(png,file="plot1.png",480,480)
dev.off()