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

#plot graph
hist(hhdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()
