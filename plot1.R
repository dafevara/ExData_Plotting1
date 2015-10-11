# Coursera Data Science Specialization
# Exploratory Data Analysis
# Author: Dan Valencia
# Email: dafevara at gmail dot com

# Course Project 1
# Plot 1


# Dependencies

options(warn=-1)

DATA_DIR <- '../'

ReadData <- function(){

  if(!file.exists(DATA_DIR)){
    print("Data dir do not exist. Please provide the Dataset Dir")
    stop()
  }

  data <- read.table(paste(DATA_DIR, "household_power_consumption.txt", sep='/'), header=TRUE, sep= ";", na.strings = c("?"))
  data$Date <- strptime(as.Date(data$Date, '%d/%m/%Y'), format = '%Y-%m-%d', tz = 'UTC')
  data <- data[data$Date > '2007-01-31' & data$Date < '2007-02-02',]

  return(data)
}

Plot1.run <- function(){

  raw.data <- ReadData()
  png(filename = "./plot1.png", width=480, height=480, units='px')
  hist(raw.data$Global_active_power, col = c('Red'), xlab = 'Global Active Power (kilowatts)', main='Global Active Power')
  dev.off()
}


Plot1.run()
