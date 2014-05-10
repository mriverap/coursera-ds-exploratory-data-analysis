##Read data
data<-read.table("household_power_consumption.txt", na.strings="?", col.names=c("Date","Time", "Active","Reactive","Voltage","Intensity","Sub1", "Sub2", "Sub3"), header=FALSE, skip=1, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

##Format data
data$Time <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[data$Date>= "2007-02-01" & data$Date <="2007-02-02",]

##Open graphics device
png(file="plot4.png", width=480, height=480, units="px")

##Construct plot
par(mfrow = c(2,2))

with(data2, {
  plot(data2$Time, data2$Active, type="l", ylab="Global Active Power", xlab="")
  plot(data2$Time, data2$Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(data2$Time, data2$Sub1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(data2$Time, data2$Sub2, col="red", type = "l")
  points(data2$Time, data2$Sub3, col="blue", type = "l")
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(data2$Time, data2$Reactive, type="l", ylab="Global_reactive_power", xlab="datetime")
})

##Close graphics device
dev.off()