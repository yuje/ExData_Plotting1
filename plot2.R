# Author: Jeffrey Yu (yuje@github.com)

# Initialize plot data.
source("download.R")

draw_plot2 <- function() {
  # Plot chart without initial X axis.
  with(plot_data, plot(as.numeric(Time), Global_active_power, type="l",
       xlab=NA, xaxt="n", ylab="Global Active Power (kilowatts)"))

  # Set custom ticks for X axis that indicate the days data faalls on.
  axis(1, at=ticks, labels=labels)
}

# Plot chart and save data to file.
draw_plot2()
dev.copy(png, "plot2.png")
dev.off()

