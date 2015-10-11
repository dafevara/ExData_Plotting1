# Coursera Data Science Specialization
# Exploratory Data Analysis
# Author: Dan Valencia
# Email: dafevara at gmail dot com

# Course Project 1
# Plot 4


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

  data$tadTemp <- paste(data$Date, data$Time)

  data$Time <- strptime(data$tadTemp, format = "%Y-%m-%d %H:%M:%S")

  return(data)
}

Plot4.run <- function(){

  data <- ReadData()

  png(filename = "./plot4.png", width=480, height=480, units='px')
  par(mfrow = c(2, 2))
  with(data, {
    #plot1
    plot(Time, Global_active_power,  ylab = 'Global Active Power', xlab='', type='s')

    #plot3
    plot(Time, Voltage, type='s', xlab='datetime')

    #plot2
    plot(Time, Sub_metering_1,  ylab = 'Energy sub metering', xlab='', type='s', col = 'black')
    lines(Time, Sub_metering_2,   type='s', col = 'red')
    lines(Time, Sub_metering_3,   type='s', col = 'blue')
    legend("topright", lty='solid', col = c('black', "blue", "red"), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


    #plot4
    plot(Time, Global_reactive_power, type='s', xlab='datetime')
  })

  dev.off()

}


Plot4.run()
