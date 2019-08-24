library(lubridate)

load_data <- function() {
    dataFilePath  <- "./data/household_power_consumption.txt"
    if(!file.exists(dataFilePath)){
        dir.create("./data")
        dataZipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        destinationFilePath <- "./data/household_power_consumption.zip"
        download.file(dataZipUrl, destfile = destinationFilePath, mode = "wb")
        unzip(destinationFilePath, exdir = "./data")
    }
    
    data <- read.table(dataFilePath, 
               header = FALSE,
               sep = ";",
               na.strings = "?",
               col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               skip = 66637, #2017-2-1 begins on line #66638
               nrows = 69517 - 66637
    )
    
    data[,1] <- dmy_hms(paste(data[,1], data[,2]), tz = "UTC")
    colnames(data)[1] <- "DateTime"
    data[,-2]
}