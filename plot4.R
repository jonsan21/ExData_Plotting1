#read data
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc$time <- strptime(paste (hpc$Date, hpc$Time), '%d/%m/%Y %H:%M:%S')

#plot 4
png("plot4.png", width=480, height=480, type = "windows")
par(mfrow = c(2, 2), mar = c(4, 5, 1, 1))

plot(hpc$time, hpc$Global_active_power, type="l", xlab ="",ylab = "Global Active Power")

plot(hpc$time, hpc$Voltage, type="l", xlab ="datetime",ylab = "Voltage")

with(hpc, plot(time, Sub_metering_1, xlab ="", type = "l", ylab = "Energy sub metering"))
with(hpc, lines(time, Sub_metering_2, col = "red"))
with(hpc, lines(time, Sub_metering_3, col = "blue"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(hpc$time, hpc$Global_reactive_power, type="l", xlab ="datetime",ylab = "Global_reactive_power")

dev.off()