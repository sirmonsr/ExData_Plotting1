## --  Plot 3 Assignment --
## Read data and select 2 days
hpcf <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
hpcr<-subset(hpcf, (Date=="1/2/2007" | Date=="2/2/2007"))
## Convert Date and Time fields to a date type
hpcdts<-paste(hpcr$Date, hpcr$Time, sep=":" )
hpcdt<-strptime(hpcdts, ,format="%d/%m/%Y:%H:%M:%S")
hpcr$DateTime<-hpcdt
## Convert data to be plotted to numeric
hpcr$Sub_metering_1<-as.numeric(hpcr$Sub_metering_1)
hpcr$Sub_metering_2<-as.numeric(hpcr$Sub_metering_2)
hpcr$Sub_metering_3<-as.numeric(hpcr$Sub_metering_3)
## Plot to a png file
png(filename = "plot3.png")
plot(hpcr$DateTime, hpcr$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(hpcr$DateTime, hpcr$Sub_metering_1, col="black")
lines(hpcr$DateTime, hpcr$Sub_metering_2, col="red")
lines(hpcr$DateTime, hpcr$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red", "blue"))
dev.off()
