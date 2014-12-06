#plot1.R

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
png(file="plot1.png",width=480,height=480)
hist(as.numeric(dat$Global_active_power), 
    col="red", 
    main="Global active power",
    xlab="Global Active Power (kilowatts)")
dev.off()




