#read data
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc$time <- strptime(paste (hpc$Date, hpc$Time), '%d/%m/%Y %H:%M:%S')

#plot 2
par(mfrow = c(1, 1), mar = c(5, 5, 2, 1))

plot(hpc$time,hpc$Global_active_power, type="l", xlab ="",ylab = "Global Active Power (kilowatts)")

#draw to png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()