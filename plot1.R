png(file.path(plot_dir,"plot1.png"),width=480,height=480)
hist(data_hh_required$Global_active_power, col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()