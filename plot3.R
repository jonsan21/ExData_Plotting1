#read data
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc$weekday <- weekdays(as.Date(hpcp$Date, "%d/%m/%Y"), abbreviate = TRUE)

#plot 3
png("plot3.png", width=480, height=480, type = "windows")

par(mfrow = c(1, 1), mar = c(5, 5, 2, 1))

with(hpc, plot(Sub_metering_1, xaxt = "n", xlab ="", type = "l", ylab = "Energy sub metering"))
with(hpc, lines(Sub_metering_2, col = "red"))
with(hpc, lines(Sub_metering_3, col = "blue"))
legend("topright", lwd =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, c(1, (nrow(hpc)/2+1), nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

dev.off()