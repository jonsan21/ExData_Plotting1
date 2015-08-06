#read data
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc$weekday <- weekdays(as.Date(hpcp$Date, "%d/%m/%Y"), abbreviate = TRUE)

#plot 1
par(mfrow = c(1, 1), mar = c(5, 5, 2, 1))

hist(hpc$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

#draw to png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()