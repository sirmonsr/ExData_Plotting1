## --  Plot 1 Assignment --
## Read data and select 2 days
hpcf <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
hpcr<-subset(hpcf, (Date=="1/2/2007" | Date=="2/2/2007"))
## Convert data to be plotted to numeric
hpcr$Global_active_power<-as.numeric(hpcr$Global_active_power)
## Plot to a png file
png(filename = "plot1.png")
hist(hpcr$Global_active_power, xlab="Gobal Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
