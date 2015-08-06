#read data
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc$weekday <- weekdays(as.Date(hpcp$Date, "%d/%m/%Y"), abbreviate = TRUE)

#plot 4
png("plot4.png", width=480, height=480, type = "windows")
par(mfrow = c(2, 2), mar = c(4, 5, 1, 1))

plot(hpc$Global_active_power, type="l", xaxt = "n", xlab ="",ylab = "Global Active Power")
axis(1, c(1, (nrow(hpc)/2+1), nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

plot(hpc$Voltage, type="l", xaxt = "n", xlab ="datetime",ylab = "Voltage")
axis(1, c(1, (nrow(hpc)/2+1), nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

with(hpc, plot(Sub_metering_1, xaxt = "n", xlab ="", type = "l", ylab = "Energy sub metering"))
with(hpc, lines(Sub_metering_2, col = "red"))
with(hpc, lines(Sub_metering_3, col = "blue"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, c(1, (nrow(hpc)/2+1), nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

plot(hpc$Global_reactive_power, type="l", xaxt = "n", xlab ="datetime",ylab = "Global_reactive_power")
axis(1, c(1, (nrow(hpc)/2+1), nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

dev.off()