## --  Plot 4 Assignment --
## Read data and select 2 days
hpcf <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
hpcr<-subset(hpcf, (Date=="1/2/2007" | Date=="2/2/2007"))
## Convert Date and Time fields to a date type
hpcdts<-paste(hpcr$Date, hpcr$Time, sep=":" )
hpcdt<-strptime(hpcdts, ,format="%d/%m/%Y:%H:%M:%S")
hpcr$DateTime<-hpcdt
## Convert data to be plotted to numeric
hpcr$Global_active_power<-as.numeric(hpcr$Global_active_power)
hpcr$Sub_metering_1<-as.numeric(hpcr$Sub_metering_1)
hpcr$Sub_metering_2<-as.numeric(hpcr$Sub_metering_2)
hpcr$Sub_metering_3<-as.numeric(hpcr$Sub_metering_3)
hpcr$Voltage<-as.numeric(hpcr$Voltage)
hpcr$Global_reactive_power<-as.numeric(hpcr$Global_reactive_power)
## Plot to a png file
png(filename = "plot4.png")
par(mfcol=c(2,2))
plot(hpcr$DateTime, hpcr$Global_active_power, type="l", xlab="", ylab="Gobal Active Power")
plot(hpcr$DateTime, hpcr$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(hpcr$DateTime, hpcr$Sub_metering_1, col="black")
lines(hpcr$DateTime, hpcr$Sub_metering_2, col="red")
lines(hpcr$DateTime, hpcr$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red", "blue"), bty = "n")
plot(hpcr$DateTime, hpcr$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(hpcr$DateTime, hpcr$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
