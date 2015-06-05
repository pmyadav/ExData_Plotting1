plot1<- function(){
library(dplyr)
library(lubridate)
hpc <- read.csv("../data/household_power_consumption.txt", sep=";", header=TRUE)
hpc1<- hpc[(as.Date(hpc$Date,"%d/%m/%Y")>= as.Date("01/02/2007", "%d/%m/%Y"))&(as.Date(hpc$Date,"%d/%m/%Y")<= as.Date("02/02/2007", "%d/%m/%Y")),]
hpc1<- mutate(hpc1, Global_active_power=as.numeric(as.character(Global_active_power)))

png(file="plot1.png")
hist(hpc1$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power(Kilowatts)")
dev.off()
}