mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header=TRUE, nrows = 100000)[66637:69516,]
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")
mydata[1:1440,"Time"] <- format(mydata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
mydata[1441:2880,"Time"] <- format(mydata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(mydata$Time,as.numeric(paste(mydata$Global_active_power)),
     type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()