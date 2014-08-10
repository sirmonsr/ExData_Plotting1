## --  Plot 2 Assignment --
## Read data and select 2 days
hpcf <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
hpcr<-subset(hpcf, (Date=="1/2/2007" | Date=="2/2/2007"))
## Convert Date and Time fields to a date type
hpcdts<-paste(hpcr$Date, hpcr$Time, sep=":" )
hpcdt<-strptime(hpcdts, ,format="%d/%m/%Y:%H:%M:%S")
hpcr$DateTime<-hpcdt
## Convert data to be plotted to numeric
hpcr$Global_active_power<-as.numeric(hpcr$Global_active_power)
## Plot to a png file
png(filename = "plot2.png")
plot(hpcr$DateTime, hpcr$Global_active_power, type="l", xlab="", ylab="Gobal Active Power (kilowatts)")
dev.off()