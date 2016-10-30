df <- read.table (file = "household_power_consumption.txt", header = TRUE, sep=";")
head (df)

#Plot3
png(filename = "plot3.png", width = 480, height = 480)
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
	 "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()