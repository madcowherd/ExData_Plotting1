# unzip the data
fil<-unz(description = "exdata-data-household_power_consumption.zip", filename='household_power_consumption.txt')
# load the data
dat<-read.csv(fil, header=TRUE, sep=";", na.strings = '?')
#filter only the relevant dates
dat <- dat[dat$Date %in% c('1/2/2007','2/2/2007'),]
#format the date and time to one
dat$DateTime  <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")

#plot to png file device
png(filename="plot2.png", width=480, height=480, units='px',bg="transparent")
#plot the lines with the correct labels
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#turn the png device off
dev.off()