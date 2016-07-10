# Author: Jeffrey Yu (yuje@github.com)

# Initialize plot data.
source("download.R")

# Plot function.
draw_plot1 <- function() {
  hist(plot_data$Global_active_power, col="red", main="Global Active Power",
       xlab="Global Active Power (kilowatts)")
}

# Plot chart and save to file.
draw_plot1()
dev.copy(png, "plot1.png")
dev.off()

