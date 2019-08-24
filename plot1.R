source("./load_data_function.R")
data <- load_data();

# ==================================================
# Histogram of frequency by global active power
# ==================================================
png(filename = "plot1.png",
    width = 500,
    height = 500,
    units = "px")

with(data, hist(Global_active_power, 
                col = "red",
                breaks = 12,
                xlab = "Global Active Power (kilowatts)",
                ylab = "Frequency",
                main = "Global Active Power"))

dev.off()