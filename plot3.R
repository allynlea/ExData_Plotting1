

elec = read.csv("household_power_consumption.csv", sep=";", na.strings="?")

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elecPower<- subset(elec, elec$Date == "2007-02-01" | elec$Date == "2007-02-02")

elecPower$DateTime<-paste(elecPower$Date,elecPower$Time)

elecPower$DateTime<-strptime(elecPower$DateTime, "%Y-%m-%d %H:%M:%S" )

png( file="plot3.png", height=480, width=480)


plot(elecPower$DateTime, elecPower$Sub_metering_1, type="l", xlab="", ylab=
			 "Energy sub metering", main="")
			 
lines(elecPower$DateTime, elecPower$Sub_metering_2, type="l", col="red")

lines(elecPower$DateTime, elecPower$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=
		 c(1,1,1), lwd = c(2.5,2.5,2.5), col=c("black", "red", "blue"))


dev.off()