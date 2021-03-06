file <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip");
unzipped <- unzip("./dataset.zip", overwrite = TRUE );

myData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA","?") );

myData$Date <- as.Date(as.character(myData$Date),  "%d/%m/%Y")
selectedDates <- myData$Date == as.Date("2007-02-01") | myData$Date == as.Date("2007-02-02");
myData <- myData[selectedDates,];

myData$Time <- strptime(myData$Time, format="%H:%M:%S")
myData[1:1440,"Time"] <- format(myData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
myData[1441:2880,"Time"] <- format(myData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

Sys.setlocale("LC_ALL", "English")

png("plot3.png", width = 480, height = 480)
plot( myData$Time,myData$Sub_metering_1, type="l", lwd=2, xlab="",ylab="Energy sub metering" )
lines( myData$Time, myData$Sub_metering_2, col="red1")
lines( myData$Time, myData$Sub_metering_3, col="blue")
legend("topright",col=c("black","red1", "blue"), lty= 1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()