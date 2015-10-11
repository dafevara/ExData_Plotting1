# Coursera Data Science Specialization
# Exploratory Data Analysis
# Author: Dan Valencia
# Email: dafevara at gmail dot com

# Course Project 1
# Plot 2


# Dependencies

options(warn=-1)
options(width=360)

DATA_DIR <- '../'

ReadData <- function(){

  if(!file.exists(DATA_DIR)){
    print("Data dir do not exist. Please provide the Dataset Dir")
    stop()
  }

  #data <- read.table(paste(DATA_DIR, "household_power_consumption.txt", sep='/'), header=TRUE, sep= ";", na.strings = c("?"))
  #data$Date <- strptime(as.Date(data$Date, '%d/%m/%Y'), format = '%Y-%m-%d', tz = 'UTC')
  #data <- data[data$Date > '2007-01-31' & data$Date < '2007-02-02',]

  data <- readRDS("preset_data.rds")
  data$tadTemp <- paste(data$Date, data$Time)

  data$Time <- strptime(data$tadTemp, format = "%Y-%m-%d %H:%M:%S")

  return(data)
}

Plot2.run <- function(){

  raw.data <- ReadData()

  png(filename = "./plot2.png", width=480, height=480, units='px')
  with(raw.data, plot(Time, Global_active_power,  ylab = 'Global Active Power (kilowatts)', xlab='', type='s'))
  dev.off()
}


Plot2.run()
