plot2 <- function(){
library(dplyr)
library(lubridate)
hpc <- read.csv("../data/household_power_consumption.txt", sep=";", header=TRUE)
hpc1<- hpc[(as.Date(hpc$Date,"%d/%m/%Y")>= as.Date("01/02/2007", "%d/%m/%Y"))&(as.Date(hpc$Date,"%d/%m/%Y")<= as.Date("02/02/2007", "%d/%m/%Y")),]
hpc1<- mutate(hpc1, Global_active_power=as.numeric(as.character(Global_active_power)))
hpc1<- mutate(hpc1, Date_Time=dmy_hms(paste(hpc1$Date,hpc1$Time)))

png(file="plot2.png")
with(hpc1, plot(hpc1$Date_Time, hpc1$Global_active_power, type="l", xlab="", ylab="Global Active Power(Kilowatts"))
dev.off()
}