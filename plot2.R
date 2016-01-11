

elec = read.csv("household_power_consumption.csv", sep=";", na.strings="?")

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elecPower<- subset(elec, elec$Date == "2007-02-01" | elec$Date == "2007-02-02")

elecPower$DateTime<-paste(elecPower$Date,elecPower$Time)

elecPower$DateTime<-strptime(elecPower$DateTime, "%Y-%m-%d %H:%M:%S" )

png(file="plot2.png", height=480, width = 480)

plot(elecPower$DateTime, elecPower$Global_active_power,type="l", main="",xlab="",
	type="l", ylab="Global Active Power (kilowatts)" )


dev.off()