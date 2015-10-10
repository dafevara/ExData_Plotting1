# Coursera Data Science Specialization
# Exploratory Data Analysis
# Author: Dan Valencia
# Email: dafevara at gmail dot com

# Course Project 1
# Plot 1


# Dependencies
library('data.table')

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
  return(data)
}

Plot1.run <- function(){

  raw.data <- ReadData()
  print(head(raw.data))

}


Plot1.run()
