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
	

	# Plot1 ----
	# 5 Visualizing the graphic
	hist(p2$Global_active_power, 
	     col="red", 
	     xlab = "Global Active Power (kilowats)", 
	     main = "Global Active Power")
	

	# 6 Exporting the graphic to .png
	png(filename = "plot1.png", width=480, height = 480)
	

	hist(p2$Global_active_power, col="red", 
	     xlab = "Global Active Power (kilowats)", 
	     main = "Global Active Power")
	dev.off()
