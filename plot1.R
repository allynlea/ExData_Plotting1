

elec = read.csv("household_power_consumption.csv", sep=";", na.strings="?")

elec$Date <- as.Date(elec$Date, "%d/%m/%Y")

elecPower<- subset(elec, elec$Date == "2007-02-01" | elec$Date == "2007-02-02")

png(file = "plot1.png",  height=480, width=480)

hist(elecPower$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",
				    main="Global Active Power")



dev.off()