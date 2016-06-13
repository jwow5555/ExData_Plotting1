## Load the full dataset
data <- read.table("C:/Users/Cissy/Documents/R Coursera/Plots/household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?")

## Format the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Take a subset of date
mydata <- subset(data, Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02") )

## Convert the date and time
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), 
                     format = "%Y-%m-%d %H:%M:%S")

## Plot 4
current.par <- par(mfrow=c(2, 2)) ## Change the setting to 2 by 2 graphs in one figure

plot(datetime,mydata$Global_active_power,  type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(datetime,mydata$Voltage,  type="l",
     ylab="Voltage", xlab="datetime")


plot(datetime,mydata$Sub_metering_1,  type="l",
     ylab="Energy Submetering", xlab="")
lines(datetime,mydata$Sub_metering_2, col = "red")
lines(datetime,mydata$Sub_metering_3, col = "blue")
legend("top", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(2,2,2), 
       col=c("black", "red", "blue"),
       bty = "n",cex=0.8,y.intersp = 0.4)

plot(datetime,mydata$Global_reactive_power,  type="l",
     ylab="Global reactive power", xlab="datetime")

par(current.par) ## Reset to default

## Save to .PNG file
dev.copy(png,'C:/Users/Cissy/Documents/R Coursera/Plots/Plot4.png',
         width=480, height=480)
dev.off()
