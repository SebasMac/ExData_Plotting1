## Step 0: download and format data -> SEE FILE plot1.R

## Step 1: creates third plot

## Converts Sub_metering variables into numeric
dfs$Sub_metering_1 <- as.numeric(dfs$Sub_metering_1)
dfs$Sub_metering_2 <- as.numeric(dfs$Sub_metering_2)
dfs$Sub_metering_3 <- as.numeric(dfs$Sub_metering_3)

## initialize graphical device = PNG
png("plot3.png", width=480, height=480)

# Plot to PNG file
with(dfs, {
        plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering") 
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
} )
legend("topright", legend = c(names(dfs)[7:9]), lty=c(1,1,1), col=c("black", "red", "blue"))

# Close dev connection
dev.off()

