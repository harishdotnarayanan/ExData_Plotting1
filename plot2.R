## plot2.R
##
## Generates the second plot for Assignment 1

# Reading the master file to a data frame
pow <- read.table("./household_power_consumption.txt", sep = ';', 
                  header = TRUE, colClasses = c("character", "character", 
                                                "numeric", "numeric", "numeric", 
                                                "numeric", "numeric", "numeric", "numeric"), 
                  na.strings = c("?"))

# Subsetting to only the required dates
pow$Date <- as.Date(pow$Date, format = "%d/%m/%Y")
pow <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02",]

# Drawing the plot for the Global Active Power
par(mar = c(5,4,4,2), mfrow=c(1,1))
with(pow, 
     plot(strptime(paste(pow$Date, pow$Time), format = "%Y-%m-%d %H:%M:%S"), 
          Global_active_power, type = "s", 
          ylab = "Global Active Power (kilowatts)", xlab = ""))

# Copying plot output to file
dev.copy(png, filename = "plot2.png", width = 480, height = 480, 
         units = "px", bg = "transparent")
dev.off()