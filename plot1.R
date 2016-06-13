## Load the full dataset
data <- read.table("C:/Users/Cissy/Documents/R Coursera/Plots/household_power_consumption.txt",
                     header=TRUE, sep=";", na.strings="?")

## Format the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Take a subset of date
mydata <- subset(data, Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02") )

## Plot1
hist(mydata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to .PNG file
dev.copy(png,'C:/Users/Cissy/Documents/R Coursera/Plots/Plot1.png',
         width=480, height=480)
dev.off()
