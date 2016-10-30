df <- read.table (file = "household_power_consumption.txt", header = TRUE, sep=";")
head (df)

#Plot2
png(filename = "plot2.png", width = 480, height = 480)
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
dev.off()