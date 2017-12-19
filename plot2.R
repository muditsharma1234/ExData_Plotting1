
##PLOT 2

png(file.path(plot_dir,"plot2.png"),width=600,height=480)
plot(data_hh_required$DateTimeFormat, data_hh_required$Global_active_power,
     type="l", 
     ylab = "Global Active Power (kilowatts)", xlab = "",
     xlim=c(min(data_hh_required$DateTimeFormat),max(data_hh_required$DateTimeFormat)))

axis(1,c(data_hh_required$DateTimeFormat[1],mean(data_hh_required$DateTimeFormat),data_hh_required$DateTimeFormat[2880]),
     labels=c("Thu","Fri","Sat"))
dev.off()