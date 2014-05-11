# Setting working directory
setwd("~/Desktop/Coursera/DataScience/03ExploratoryDataAnalysis/CourseraProject01")

# Loading Data
classes<-c("character","character","numeric","numeric","numeric","numeric",
           "numeric","numeric")
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 colClasses=classes,na.strings="?")

# Transforming date & time to the appropiate class objects in r
data$Time=strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$Date=as.Date(data$Date,"%d/%m/%Y")

# Subsetting data for 2007-02-01 and 2007-02-02
subdata<-subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
rm(data,classes)

# Adding subplots
par(mfcol=c(2,2),mar=c(4.2,4.2,2,0.5),cex=0.7)
plot(subdata$Time,subdata$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(subdata$Time,subdata$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(subdata$Time,subdata$Sub_metering_2,col="red")
lines(subdata$Time,subdata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
plot(subdata$Time,subdata$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(subdata$Time,subdata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#Save to png format
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()