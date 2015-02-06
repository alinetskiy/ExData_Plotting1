#
# Produce plot #4 for the Project #1 in the Exploratory Data Analysis course.
# The plot is drawn to file "plot4.png"
# Four plots on one image.
#
# Please see README.md for the details on the assignment
#

makePlot4 <- function () {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile="household_power_consumption.zip")
  data <- read.csv(unz('household_power_consumption.zip', 'household_power_consumption.txt'), sep=";", na.strings="?", stringsAsFactors = FALSE)
  plotdata <- subset(data, Date =="1/2/2007" | Date =="2/2/2007")
  plotdata$Time =  paste(plotdata$Date, " ", plotdata$Time)
  plotdata$Date = as.Date(plotdata$Date, format="%d/%m/%Y")
  plotdata$Time = strptime(plotdata$Time, format="%d/%m/%Y %H:%M:%S")
  png(file="plot4.png", width=480, height=480)
  
  par(mfcol=c(2,2))
  with(plotdata, {
    # subplot 1 - copy of plot2
    plot(Time, Global_active_power,  ylab="Global Active Power", xlab="", type="n")
    lines(Time, Global_active_power)
    
    # subplot 2 - copy of plot 3
    plot(Time, Sub_metering_1,  ylab="Energy sub metering", xlab="", type="n")
    
    lines(Time, Sub_metering_1)
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", lwd=1, bty = "n", col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    # subplot 3 
    plot(Time, Voltage, xlab="datetime", type="n")
    lines(Time, Voltage)

    # subplot 4 
    plot(Time, Global_reactive_power, xlab="datetime", type="n")
    lines(Time, Global_reactive_power)
  })  

  
  dev.off()
}
