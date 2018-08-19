##Plot1.R
## This code reads file "household_power_consumption.txt"
## extract the data corresponding to days 2007-02-01 to 2007-02-02
## then plot the histogram of Global active power in kilowats.

##Reads file
EPC <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?")
## sets column Date as character
## Sets column Time as character
EPC[,1] <- as.character(EPC[,1])
EPC[,2] <- as.character(EPC[,2])

## set Date column  as Date type
EPC[,1]<- as.Date(EPC[,1],"%d/%m/%Y")

## subsets 2 days only
EPC.2.days <- EPC[(EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02"),]


##clean memory by removing EPC data set
rm(EPC)

##Plot histogram in red color with main title and x label.
hist(EPC.2.days$Global_active_power, col= "red", main = "Global Active Power", xlab="Global Active Power (kilowats)")

##Save plot in png file plot1.png 
dev.copy(png,'plot1.png')
##close png device 
dev.off()