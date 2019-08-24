source("./load_data_function.R")
data <- load_data();

# ==================================================
# Line graph of global active power over time
# ==================================================
png(filename = "plot2.png",
    width = 500,
    height = 500,
    units = "px")

with(data, plot(DateTime,
                Global_active_power, 
                type ="l",
                ylab = "Global Active Power (kilowatts)",
                xlab = ""))

dev.off()