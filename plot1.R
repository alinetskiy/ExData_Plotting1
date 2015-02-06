#
# Produce plot # 1 for the Project #1 in the Exploratory Data Analysis course.
# The plot is drawn to file "plot1.png".
# Histogram of Global Active Power in red color.
#
# Please see README.md for the details on the assignment
#

makePlot1 <- function () {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile="household_power_consumption.zip")
  data <- read.csv(unz('household_power_consumption.zip', 'household_power_consumption.txt'), sep=";", na.strings="?", stringsAsFactors = FALSE)
  plotdata <- subset(data, Date =="1/2/2007" | Date =="2/2/2007")
  plotdata$Date = as.Date(plotdata$Date, format="%d/%m/%Y")
  plotdata$Time = strptime(plotdata$Time, format="%H:%M:%S")
  png(file="plot1.png", width=480, height=480)
  with(plotdata, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))  
  dev.off()
}
