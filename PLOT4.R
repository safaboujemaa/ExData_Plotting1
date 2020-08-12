# 1 Reading the file ----
	p <- read.table(file="household_power_consumption.txt", sep = ";")
	p[] <- lapply(p, as.character)
	names <- as.character(p[1,])
	p <- p[-1,]
	colnames(p) <- names
	

	# 2 Subseting the dataset
	p2 <- p[p$Date == "1/2/2007" | p$Date == "2/2/2007", ]
	

	# 3 Asigning NA to missing values recorded as: "?"
	p2[] <- lapply(p2, gsub, pattern = "?", replacement = "NA", fixed = TRUE)
	

	# Changing class to time
	require(lubridate)
	p2$t <- paste(p2$Date, p2$Time)
	p2$t <- dmy_hms(p2$t)
	

	# 4 Changing variable to numeric
	p2$Global_active_power <- as.numeric(p2$Global_active_power)
	

	#Plot4 ----
	# 4 Changing variable to numeric
	p2$Global_active_power <- as.numeric(p2$Global_active_power)
	p2$Voltage <- as.numeric(p2$Voltage)
	p2$Global_reactive_power <- as.numeric(p2$Global_reactive_power)
	p2$Sub_metering_1 <- as.numeric(p2$Sub_metering_1)
	p2$Sub_metering_2 <- as.numeric(p2$Sub_metering_2)
	p2$Sub_metering_3 <- as.numeric(p2$Sub_metering_3)
	

	# 5 Visualizing the graphic
	#1
	par(mfrow=c(2,2))
	hist(p2$Global_active_power, col="red", 
	     xlab = "Global Active Power (kilowats)", 
	     main = "Global Active Power")
	

	#2
	plot(p2$t, p2$Voltage, type="l",
	     xlab="datetime",
	     ylab = "Voltage")
	

	# 3
	plot(p2$t, p2$Sub_metering_1, type="l", 
	     ylab = "Energy sub metering",
	     xlab = "")
	lines(p2$t, p2$Sub_metering_2, col="red")
	lines(p2$t, p2$Sub_metering_3, col="blue")
	legend("topright", 
	       legend =c("Sub metering 1","Sub metering 2","Sub metering 3"),
	       lty =  c(1,1,1), col = c("black", "red", "blue"), cex = 0.5)
	

	#4 
	plot(p2$t, p2$Global_reactive_power, type = "l",
	     xlab = "",
	     ylab = "Global reactive power")
	

	# 6 Exporting the graphic to .png
	png(filename = "plot4.png", width=480, height = 480)
	par(mfrow=c(2,2))
	#1
	hist(p2$Global_active_power, col="red", 
	     xlab = "Global Active Power (kilowats)", 
	     main = "Global Active Power")
	

	#2
	plot(p2$t, p2$Voltage, type="l",
	     xlab="datetime",
	     ylab = "Voltage")
	

	# 3
	plot(p2$t, p2$Sub_metering_1, type="l", 
	     ylab = "Energy sub metering",
	     xlab = "")
	lines(p2$t, p2$Sub_metering_2, col="red")
	lines(p2$t, p2$Sub_metering_3, col="blue")
	legend("topright", 
	       legend =c("Sub metering 1","Sub metering 2","Sub metering 3"),
	       lty =  c(1,1,1), col = c("black", "red", "blue"), cex = 0.5)
	

	#4 
	plot(p2$t, p2$Global_reactive_power, type = "l",
	     xlab = "",
	     ylab = "Global reactive power")
	

	dev.off()
	

	par(mfrow=c(1,1))


