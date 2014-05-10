##Read data
data<-read.table("household_power_consumption.txt", na.strings="?", col.names=c("Date","Time", "Active","Reactive","Voltage","Intensity","Sub1", "Sub2", "Sub3"), header=FALSE, skip=1, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

##Format data
data$Time <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[data$Date>= "2007-02-01" & data$Date <="2007-02-02",]

##Open graphics device
png(file="plot1.png", width=480, height=480, units="px")

##Construct plot
hist(data2$Active, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

##Close graphics device
dev.off()