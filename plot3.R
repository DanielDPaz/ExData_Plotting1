source("./load_data_function.R")
data <- load_data();

# ==================================================
# Line graph of energy sub metering over time
# ==================================================
png(filename = "plot3.png",
    width = 500,
    height = 500,
    units = "px")

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
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()