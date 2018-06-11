mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header=TRUE, nrows = 100000)[66637:69516,]
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")
mydata[1:1440,"Time"] <- format(mydata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
mydata[1441:2880,"Time"] <- format(mydata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(mydata$Time,as.numeric(paste(mydata$Global_active_power)),
     type="l",  xlab="",ylab="Global Active Power")  
plot(mydata$Time,as.numeric(paste(mydata$Voltage)), 
     type="l",xlab="datetime",ylab="Voltage")
plot(mydata$Time,mydata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(mydata,lines(Time,as.numeric(paste(Sub_metering_1))))
with(mydata,lines(Time,as.numeric(paste(Sub_metering_2)),col="red"))
with(mydata,lines(Time,as.numeric(paste(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
plot(mydata$Time,as.numeric(paste(mydata$Global_reactive_power)),
     type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()