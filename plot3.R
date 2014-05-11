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

# Adding more than one plot
plot(subdata$Time,subdata$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(subdata$Time,subdata$Sub_metering_2,col="red")
lines(subdata$Time,subdata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

#Save to png format
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
