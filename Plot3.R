##Plot3.R
## This code reads file "household_power_consumption.txt"
## extract the data corresponding to days 2007-02-01 to 2007-02-02
## then plot the Sub metering 1, 2, and 3 as a function of time.


##Reads file
EPC <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?")
## sets column Date as character
## Sets column Time as character
EPC[,1] <- as.character(EPC[,1])
EPC[,2] <- as.character(EPC[,2])

##combine Date and Time in one character vector
EPC[,2] <- paste(EPC$Date, EPC$Time)
## set Time.scale as time type
time.scale <- strptime(EPC[,2], "%d/%m/%Y %H:%M:%S")


## set Date column  as Date type
EPC[,1]<- as.Date(EPC[,1],"%d/%m/%Y")


## subsets 2 days only
EPC.2.days <- EPC[(EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02"),]
time.scale.2.days <- time.scale[(EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02"),]

##clean memory by removing EPC data set
rm(EPC)


plot(time.scale.2.days ,EPC.2.days$Sub_metering_1,type = "l",xlab = "", ylab = "Energy sub metering")
lines(time.scale.2.days ,EPC.2.days$Sub_metering_2,type = "l",col="red")
lines(time.scale.2.days ,EPC.2.days$Sub_metering_3,type = "l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8)


dev.copy(png,'plot3.png')
dev.off()