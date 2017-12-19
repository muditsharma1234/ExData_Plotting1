##PLOT 4
png(file.path(plot_dir,"plot4.png"),width=600,height=600)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2))

## (0, 0) Plot
plot(data_hh_required$DateTimeFormat, data_hh_required$Global_active_power,
     type="l", ylab = "Global Active Power", xlab = "")

axis(1,c(data_hh_required$DateTimeFormat[1],mean(data_hh_required$DateTimeFormat),data_hh_required$DateTimeFormat[2880]),
     labels=c("Thu","Fri","Sat"))

## (0, 1) Plot
plot(data_hh_required$DateTimeFormat, data_hh_required$Voltage, type = "l", 
     ylab ="Voltage", xlab = "datetime")

axis(1,c(data_hh_required$DateTimeFormat[1],mean(data_hh_required$DateTimeFormat),data_hh_required$DateTimeFormat[2880]),
     labels=c("Thu","Fri","Sat"))


## (1, 0) Plot
plot(data_hh_required$DateTimeFormat, data_hh_required$Sub_metering_1,
     type="l", ylab = "Energy sub metering", xlab = "")

axis(1,c(data_hh_required$DateTimeFormat[1],mean(data_hh_required$DateTimeFormat),data_hh_required$DateTimeFormat[2880]),
     labels=c("Thu","Fri","Sat"))


lines(data_hh_required$DateTimeFormat, data_hh_required$Sub_metering_2, col="red")
lines(data_hh_required$DateTimeFormat, data_hh_required$Sub_metering_3, col = "blue")

legendText <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

legend("topright", # places a legend at the appropriate place
       legendText, # puts text in the legend
       lty = c(1,1), # gives the legend appropriate symbols (lines)
       lwd = c(2.5, 2.5), col=c("black","red", "blue"), # gives the legend lines
       # the correct color and width 
       cex = 0.75,                      # Character expansion factor
       bty = "n")                       # Remove border

## (1, 1) Plot
plot(data_hh_required$DateTimeFormat, data_hh_required$Global_reactive_power, type =
       "l", xlab = "datetime", ylab = "Global_reactive_power")

par(opar)
dev.off()
