## Step 0: download and format data -> SEE FILE plot1.R

## Step 1: creates fourth plot

## Converts Reactive_power and Voltage variables into numeric
dfs$Global_reactive_power <- as.numeric(dfs$Global_reactive_power)
dfs$Voltage <- as.numeric(dfs$Voltage)

## initializes graphical device = PNG
png("plot4.png", width=480, height=480)

## sets plot lay-out
par(mfrow = (c(2,2)))

## Plots to PNG file
with(dfs, {
        plot(datetime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
        plot(datetime, Voltage, type="l", xlab = "datetime")
        {plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering") 
                lines(datetime, Sub_metering_2, col="red")
                lines(datetime, Sub_metering_3, col="blue")
                legend("topright", legend = c(names(dfs)[7:9]), lty=c(1,1,1), col=c("black", "red", "blue"))
        }
        plot(datetime, Global_reactive_power, type="l", xlab = "datetime")
} )


## Close dev connection
dev.off()