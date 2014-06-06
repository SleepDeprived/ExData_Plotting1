createPlot2 <- function() {
  
  data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, sep = ";")
  colnames(data) <- tolower(colnames(data))
  
  data$date_time <- strptime(paste(data$date, data$time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  data$date <- as.Date(data$date, format="%d/%m/%Y")
  
  powerData <- data[data$date >= as.Date("2007-02-01", format = "%Y-%m-%d"), ]
  powerData <- powerData[powerData$date <= as.Date("2007-02-02", format = "%Y-%m-%d"), ]
  rm(data)
  
  png("plot2.png", width = 480, height = 480, units="px")
  
  # add code here to make plot
  plot(powerData$date_time, powerData$global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  
}


