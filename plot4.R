

elec = read.csv("household_power_consumption.csv", sep=";", na.strings="?")

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elecPower<- subset(elec, elec$Date == "2007-02-01" | elec$Date == "2007-02-02")

elecPower$DateTime<-paste(elecPower$Date,elecPower$Time)

elecPower$DateTime<-strptime(elecPower$DateTime, "%Y-%m-%d %H:%M:%S" )

png( file="plot4.png", height=480, width=480)

par(mfrow= c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with (elecPower, {
     plot(elecPower$DateTime, elecPower$Global_active_power,type="l",
     	main="",xlab="", ylab="Global Active Power (kilowatts)" )
     plot(DateTime, Voltage, type = "l") 


     plot(elecPower$DateTime, elecPower$Sub_metering_1, type="l", xlab="", ylab=
			 "Energy sub metering", main="")
			 
     lines(elecPower$DateTime, elecPower$Sub_metering_2, type="l", col="red")

     lines(elecPower$DateTime, elecPower$Sub_metering_3, type="l", col="blue")

     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), lwd = c(2.5,2.5,2.5), col=c("black", "red", "blue"), cex=.8)

     plot(DateTime, Global_reactive_power, type="l")
  })


dev.off()