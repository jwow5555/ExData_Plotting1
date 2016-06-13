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

## Plot 2
plot(datetime,mydata$Global_active_power,  type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to .PNG file
dev.copy(png,'C:/Users/Cissy/Documents/R Coursera/Plots/Plot2.png',
         width=480, height=480)
dev.off()
