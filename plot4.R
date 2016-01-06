# unzip the data
fil<-unz(description = "exdata-data-household_power_consumption.zip", filename='household_power_consumption.txt')
# load the data
dat<-read.csv(fil, header=TRUE, sep=";", na.strings = '?')
#filter only the relevant dates
dat <- dat[dat$Date %in% c('1/2/2007','2/2/2007'),]
#format the date and time to one
dat$DateTime  <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")

#plot to png file device
png(filename="plot4.png", width=480, height=480, units='px',bg="transparent")
#split the screen to 2x2
split.screen(c(2,2))

#select first screen and plot
screen(1)
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#select the second screen and create voltage vs time plot
screen(2)
plot(dat$DateTime,dat$Voltage,type="l",xlab="datetime",ylab="Voltage")

#select third screen and create submetering plot (legend is slightly different)
screen(3)
plot(dat$DateTime,dat$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(dat$DateTime,dat$Sub_metering_2,col="red")
lines(dat$DateTime,dat$Sub_metering_3,col="blue")
#add a legend (no border, text is smaller)
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.75,bty="n")

#screen 4 and global reactive power vs time
screen(4)
plot(dat$DateTime,dat$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#turn the png device off
dev.off()