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

# Construct line plot
plot(subdata$Time,subdata$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

#Save to png format
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()