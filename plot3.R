createPlot3 <- function() {
  
  data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, sep = ";")
  colnames(data) <- tolower(colnames(data))
  
  data$date_time <- strptime(paste(data$date, data$time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  data$date <- as.Date(data$date, format="%d/%m/%Y")
  
  powerData <- data[data$date >= as.Date("2007-02-01", format = "%Y-%m-%d"), ]
  powerData <- powerData[powerData$date <= as.Date("2007-02-02", format = "%Y-%m-%d"), ]
  rm(data)
  
  png("plot3.png", width = 480, height = 480, units="px")
  
  plot(powerData$date_time, powerData$sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(powerData$date_time, powerData$sub_metering_1, col = "black", type = "l", cex = 0)
  points(powerData$date_time, powerData$sub_metering_2, col = "red", type = "l", cex = 0)
  points(powerData$date_time, powerData$sub_metering_3, col = "blue", type = "l", cex = 0)
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
  
}


