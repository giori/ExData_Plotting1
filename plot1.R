file <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip");
unzipped <- unzip("./dataset.zip", overwrite = TRUE );

myData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA","?") );

myData$Date <- as.Date(as.character(myData$Date),  "%d/%m/%Y")
selectedDates <- myData$Date == as.Date("2007-02-01") | myData$Date == as.Date("2007-02-02");

myData <- myData[selectedDates,];

png("plot1.png", width = 480, height = 480)
hist(myData$Global_active_power, col="red1", xlab="Global Active Power (kilowatts)", ylab="Frequency", xlim=c(0,8), ylim=c(0, 1200), main="Global Active Power", axes=FALSE )
axis(1, at=seq(0 , 6, by=2));
axis(2, at=seq(0 , 1200, by=200));
dev.off()