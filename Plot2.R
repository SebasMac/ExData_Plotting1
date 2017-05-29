## Step 0: download and format data -> SEE FILE plot1.R

## Step 1: creates second plot

## Creates a new variable DateTime that Converts Date & Time to  DateTime
dfs$datetime <- strptime(paste(dfs$Date, dfs$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## initialize graphical device = PNG
png("plot2.png", width=480, height=480)

## Plot to PNG file
with(dfs, plot(dfs$datetime,dfs$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") )

## Close dev connection
dev.off()