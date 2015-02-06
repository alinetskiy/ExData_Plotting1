#
# Produce plot #2 for the Project #1 in the Exploratory Data Analysis course.
# The plot is drawn to file "plot2.png".
# Line chart of Global Active Power
#
# Please see README.md for the details on the assignment
#

makePlot2 <- function () {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile="household_power_consumption.zip")
  data <- read.csv(unz('household_power_consumption.zip', 'household_power_consumption.txt'), sep=";", na.strings="?", stringsAsFactors = FALSE)
  plotdata <- subset(data, Date =="1/2/2007" | Date =="2/2/2007")
  plotdata$Time =  paste(plotdata$Date, " ", plotdata$Time)
  plotdata$Date = as.Date(plotdata$Date, format="%d/%m/%Y")
  plotdata$Time = strptime(plotdata$Time, format="%d/%m/%Y %H:%M:%S")
  png(file="plot2.png", width=480, height=480)
  
  with(plotdata, {
    plot(Time, Global_active_power,  ylab="Global Active Power (kilowatts)", xlab="", type="n")
    lines(Time, Global_active_power)
    
    })  
  dev.off()
}
