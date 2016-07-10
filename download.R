
if (!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power_consumption.zip")
  unzip("power_consumption.zip")
}

hpc_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

hpc_data$Time <- strptime(paste(hpc_data$Date, hpc_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc_data$Date <- as.Date(hpc_data$Date, format="%d/%m/%Y")
for (col in 3:9) {
  hpc_data[[col]] <- as.numeric(hpc_data[[col]])
}

start <- as.Date("2007-02-01", "%Y-%m-%d")
end <- as.Date("2007-02-02", "%Y-%m-%d")
plot_data <- subset(hpc_data, Date >= start & Date <= end)
