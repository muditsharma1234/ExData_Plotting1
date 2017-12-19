###PLOT 3
png(file.path(plot_dir,"plot3.png"),width=600,height=480)
plot(data_hh_required$DateTimeFormat, data_hh_required$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")

axis(1,c(data_hh_required$DateTimeFormat[1],mean(data_hh_required$DateTimeFormat),data_hh_required$DateTimeFormat[2880]),
     labels=c("Thu","Fri","Sat"))

lines(data_hh_required$DateTimeFormat, data_hh_required$Sub_metering_2, col="red")
lines(data_hh_required$DateTimeFormat, data_hh_required$Sub_metering_3, col="blue")

legendText <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

legend("topright",
       legendText, # puts text in the legend
       lty = c(1,1), # gives the legend appropriate symbols (lines)
       lwd = c(2.5, 2.5), col=c("black","red", "blue"), # gives the legend lines
       # the correct color and width 
       cex = 0.75)                      # Character expansion factor)
dev.off()