createPlot4 <- function() {
  
  data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, sep = ";")
  colnames(data) <- tolower(colnames(data))
  
  data$date_time <- strptime(paste(data$date, data$time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  data$date <- as.Date(data$date, format="%d/%m/%Y")
  
  powerData <- data[data$date >= as.Date("2007-02-01", format = "%Y-%m-%d"), ]
  powerData <- powerData[powerData$date <= as.Date("2007-02-02", format = "%Y-%m-%d"), ]
  rm(data)
  
  png("plot4.png", width = 480, height = 480, units="px")
  
  par(mfrow = c(2,2), mar = c(5, 4, 1, 1),  cex.lab = 0.75, cex.axis = 0.75)
  with(powerData,{
    plot(date_time, global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
    points(date_time, global_active_power, col = "black", type = "l", cex = 0)
    
    plot(date_time, voltage, type = "n", xlab = "datetime", ylab = "Voltage")
    points(date_time, voltage, col = "black", type = "l", cex = 0)
    
    plot(date_time, sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    points(date_time, sub_metering_1, col = "black", type = "l", cex = 0)
    points(date_time, sub_metering_2, col = "red", type = "l", cex = 0)
    points(date_time, sub_metering_3, col = "blue", type = "l", cex = 0)
    legend("topright", lty = 1, cex = 0.7, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
    plot(date_time, global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
    points(date_time, global_reactive_power, col = "black", type = "l", cex = 0)
    
  })
  
  dev.off()
  
}


