# Author: Jeffrey Yu (yuje@github.com)

# Only run script if expected data not populated in environment.
if (!"plot_data" %in% ls()) {
  # Check if data source exists; download if not found.
  if (!file.exists("household_power_consumption.txt")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile="power_consumption.zip")
    unzip("power_consumption.zip")
  }

  # Read in data and format into appropriate types.
  hpc_data <- read.table("household_power_consumption.txt", sep=";",
                         header=TRUE, na.strings="?")
  hpc_data$Time <- strptime(paste(hpc_data$Date, hpc_data$Time, sep=" "),
                            "%d/%m/%Y %H:%M:%S")
  hpc_data$Date <- as.Date(hpc_data$Date, format="%d/%m/%Y")
  for (col in 3:9) {
    hpc_data[[col]] <- as.numeric(hpc_data[[col]])
  }

  # Subset data into desired date ranges for plotting.
  start <- as.Date("2007-02-01", "%Y-%m-%d")
  end <- as.Date("2007-02-02", "%Y-%m-%d")
  plot_data <- subset(hpc_data, Date >= start & Date <= end)


  # Common labels used for datetime X axis labeling.
  ticks <- as.numeric(c(min(plot_data$Time),
                      as.POSIXlt(mean(plot_data$Time)),
                      as.POSIXlt("2007-02-03 00:00:00")))
  labels=c("Thu", "Fri", "Sat")
}
