source("./load_data_function.R")
data <- load_data();

# ==================================================
# 4 graphs combined
# ==================================================
png(filename = "plot4.png",
    width = 500,
    height = 500,
    units = "px")

par(mfcol = c(2,2))

# Top left
with(data, plot(DateTime,
                Global_active_power, 
                type ="l",
                ylab = "Global Active Power",
                xlab = ""))

# Bottom left
with(data, {
    plot(DateTime,
         Sub_metering_1, 
         col = "black",
         type ="l",
         ylab = "Energy sub metering",
         xlab = "")
    points(DateTime,
           Sub_metering_2, 
           type ="l",
           col = "red")
    points(DateTime,
           Sub_metering_3,
           type ="l", 
           col = "blue")
}
)

legend("topright", 
       lwd = 1,
       bty = "n",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Top right
with(data, plot(DateTime,
                Voltage, 
                col = "black",
                type ="l",
                ylab = "Voltage",
                xlab = "datetime"))

# Bottom right
with(data, plot(DateTime,
                Global_reactive_power, 
                col = "black",
                type ="l",
                ylab = "Global_reactive_power",
                xlab = "datetime",
                ylog = FALSE,
                yaxp = c(0.0, 0.5, 5)))

dev.off()