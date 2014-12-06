#plot4.R

#set directory vars
setwd("~/classes/ExploratoryData/proj1")

#download and unzip the data set 
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataUrl, destfile = zipfile, method = "curl")
unzip(zipfile)
  
#create a subset of the full data which contains only the relevent dates
#the resulting reduced data set was used to create all plots.
pw <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors = FALSE)
dat <- subset(pw, pw$Date == "1/2/2007" | pw$Date == "2/2/2007")
write.csv(dat, file = "1-2_02_dat.csv")

#read in the data subset
dat <- read.csv("1-2_02_dat.csv",stringsAsFactors = FALSE)

#create plot with the following commands:
library(datasets)

png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))

x <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
y <- dat$Global_active_power
plot(x,y,ylab = "Global Active Power",type = "l")

x <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
y <- dat$Voltage
plot(x,y,ylab = "Voltage",type = "l")

color <- c("black","red","blue")
leg_text <- c("Sub metering 1","Sub metering 2","Sub metering 3")
x <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
yrange <- range(c(as.numeric(dat$Sub_metering_1), as.numeric(dat$Sub_metering_2), as.numeric(dat$Sub_metering_3)))
y <- as.numeric(dat$Sub_metering_1)
plot(x,y,ylab = "Energy sub metering",type = "l",col = color[1],ylim = yrange)
lines(x,dat$Sub_metering_2,type="l",col=color[2])
lines(x,dat$Sub_metering_3,type="l",col=color[3]) 
legend("topright", legend = leg_text, col=color, pch="___")

x <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
y <- dat$Global_reactive_power
plot(x,y,ylab = "Global Reactive Power",type = "l")

dev.off()



