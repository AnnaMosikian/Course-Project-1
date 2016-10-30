df <- read.table (file = "household_power_consumption.txt", header = TRUE, sep=";")
head (df)

#Plot4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

df["DateTime"] <- as.POSIXct(paste(df[,1], df[,2], sep = " "), format = "%d/%m/%Y %H:%M:%S")
DataTime <- df["DateTime"]
plot(unclass(df$DateTime), df$Global_active_power/500, type = "l",
ylab = "Global Activy Power (kilowatts)", xlab = "",xaxt = "n", yaxt = "n",
axes = TRUE)
minDate <- min(unclass(df$DateTime))
maxDate <- max(unclass(df$DateTime))
axis(1, seq (minDate, maxDate, by = (maxDate - minDate)/2),labels = c("Thu", "Fri", "Sat"))
axis (2, seq(0, max(df$Global_active_power)/500*0.75,
	by = max(df$Global_active_power)/500/3*0.75),seq (0, 6, by = 2))

maxValue <- max(targetData$Voltage)
plot(unclass(df$DateTime), df$Voltage, type = "l", ylab = "Voltage",
	xlab = "datetime", xaxt = "n", yaxt = "n", axes = TRUE)
minDate <- min(unclass(df$DateTime))
maxDate <- max(unclass(df$DateTime))
axis(1, seq (minDate, maxDate, by = (maxDate - minDate)/2),labels = c("Thu", "Fri", "Sat"))
axis (2, seq(234, 246, by = 4), seq(234, 246, by = 4))

df["DateTime"] <- as.POSIXct(paste(df[,1], df[,2], sep = " "), format = "%d/%m/%Y %H:%M:%S")
DataTime <- df["DateTime"]
plot(unclass(df$DateTime),df$Sub_metering_1, ylim = range(df$Sub_metering_1),
	col = "black", type = "n", ylab = "Energy sub metering", xlab = "",
	xaxt = "n", yaxt = "n", axes = TRUE)
lines(unclass(df$DateTime), df$Sub_metering_1, col = "black")
lines(unclass(df$DateTime), df$Sub_metering_2, col = "red")
lines(unclass(df$DateTime), df$Sub_metering_3, col = "blue")
minDate <- min(unclass(df$DateTime))
maxDate <- max(unclass(df$DateTime))
axis(1, seq (minDate, maxDate, by = (maxDate - minDate)/2),labels = c("Thu", "Fri", "Sat"))
axis (2, seq(0, max(df$Sub_metering_1)*0.75,by = max(df$Sub_metering_1)/3*0.75),
	seq (0, 30, by = 10))
legend(x = "topright", lty=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2",
	 "Sub_metering_3"), col = c("black", "red", "blue"), bty="n")

maxValue <- max(df$Global_reactive_power)
plot(unclass(df$DateTime), df$Global_reactive_power, type = "l",
	xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n", yaxt = "n",
	axes = TRUE)
minDate <- min(unclass(df$DateTime))
maxDate <- max(unclass(df$DateTime))
axis(1,seq (minDate, maxDate, by = (maxDate - minDate)/2),labels = c("Thu", "Fri", "Sat"))
axis (2, seq(0.0, 0.5, by = 0.1), c("0.0", "0.1" , "0.2", "0.3", "0.4", "0.5" ))
dev.off()