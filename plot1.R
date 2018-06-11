mydata <- read.table(file = "household_power_consumption.txt",
                sep = ";", header=TRUE, nrows = 100000)[66637:69516,]
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
png("plot1.png", width=480, height=480)
hist(as.numeric(paste(mydata$Global_active_power)),main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

