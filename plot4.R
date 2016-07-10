# Author: Jeffrey Yu (yuje@github.com)

# Initialize plot data and draw functions.
source("download.R")
source("plot2.R")
source("plot3.R")

# Set up globals to display 4 plots.
par(mfrow=c(2, 2))

# First plot.
draw_plot2()

# Second plot.
with(plot_data, plot(as.numeric(Time), Voltage, type="l", xlab="datetime",
     xaxt="n", ylab="Voltage"))
# Set custom ticks for X axis that indicate the days data faalls on.
axis(1, at=ticks, labels=labels)

# Third plot.
draw_plot3()

# Fourth plot
with(plot_data, plot(as.numeric(Time), Global_reactive_power, type="l",
     xlab="datetime", xaxt="n"))
# Set custom ticks for X axis that indicate the days data faalls on.
axis(1, at=ticks, labels=labels)

# Save plot to file.
dev.copy(png, "plot4.png")
dev.off()

