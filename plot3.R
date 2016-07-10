# Author: Jeffrey Yu (yuje@github.com)

# Initialize plot data.
source("download.R")

# Plot 3 lines, then annotate appropriate axis and legend.
draw_plot3 <- function() {
  with(plot_data, plot(as.numeric(Time), Sub_metering_1, type="l", xlab=NA,
       xaxt="n", ylab="Energy sub metering"))
  with(plot_data, lines(as.numeric(Time), Sub_metering_2, col="red"))
  with(plot_data, lines(as.numeric(Time), Sub_metering_3, col="blue"))
  axis(1, at=ticks, labels=labels)
  legend("topright", lwd=1, col=c("black", "red", "blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

# Draw plot and save to file.
draw_plot3()
dev.copy(png, "plot3.png")
dev.off()

