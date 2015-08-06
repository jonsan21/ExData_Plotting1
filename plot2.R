#read data
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc$weekday <- weekdays(as.Date(hpcp$Date, "%d/%m/%Y"), abbreviate = TRUE)

#plot 2
par(mfrow = c(1, 1), mar = c(5, 5, 2, 1))

plot(hpc$Global_active_power, type="l", xaxt = "n", xlab ="",ylab = "Global Active Power (kilowatts)")
axis(1, c(1, (nrow(hpc)/2+1), nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

#draw to png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()