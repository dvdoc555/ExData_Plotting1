# download File if it doesn't exist

if(!file.exists("household_power_consumption.txt")){
  fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,"Bugs.zip")
  unzip("Bugs.zip")
  unlink("Bugs.zip")
}

#read data
hhdata<-read.table("household_power_consumption.txt", sep=";",header=TRUE,skip=66636,nrows=2280)
hhnames<-read.table("household_power_consumption.txt", sep=";",nrows=1,header=TRUE)
names(hhdata)<-names(hhnames)

# Make character data into time data

library(lubridate)
hhdata$Date<-dmy(hhdata$Date)
hhdata$Time<-hms(hhdata$Time)
hhdata$dt<-hhdata$Date+hhdata$Time

par(mfrow=c(2,2))



plot(hhdata$dt,hhdata$Global_active_power,ylab="Global Active Power",type="l")

plot(hhdata$dt,hhdata$Voltage,ylab="Voltage",type="l")

plot(hhdata$dt,hhdata$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
points(hhdata$dt,hhdata$Sub_metering_1,type="l")
points(hhdata$dt,hhdata$Sub_metering_2,col="red",type="l")
points(hhdata$dt,hhdata$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))

plot(hhdata$dt,hhdata$Global_reactive_power,ylab="Global_reactive_power",type="l")

par(bg="white")

dev.copy(png,file="plot4.png")
dev.off()
