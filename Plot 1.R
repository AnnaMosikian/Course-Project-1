df <- read.table (file = "household_power_consumption.txt", header = TRUE, sep=";")
head (df)

#Plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
	main="Global active power")
dev.off()