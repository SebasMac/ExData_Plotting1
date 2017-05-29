## Step 0: download and subset dataset 
## NOTE: for simplicity this step will be done only for the first graph)

## checks if the data directory exists and if not it creates it
if(!file.exists("data")){dir.create("data")}

## define location of download file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./data/dataset.zip") 
unzip("./data/dataset.zip")

## reads data
df<-read.table("./data/household_power_consumption.txt",  header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 

##subsets data based on dates
dfs <- subset(df, df$Date=="1/2/2007"|df$Date=="2/2/2007")

## Converts Global_active_power into numeric
dfs$Global_active_power <- as.numeric(dfs$Global_active_power)

## Step 1: creates first plot
## initialize graphical device = PNG
png("plot1.png", width=480, height=480)

## plot to PNG file
with(dfs, hist(Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)") )

# Close dev connection
dev.off()
