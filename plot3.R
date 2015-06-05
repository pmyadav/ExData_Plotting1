plot3 <- function(){
  library(dplyr)
  library(lubridate)
  hpc <- read.csv("../data/household_power_consumption.txt", sep=";", header=TRUE)
  hpc1<- hpc[(as.Date(hpc$Date,"%d/%m/%Y")>= as.Date("01/02/2007", "%d/%m/%Y"))&(as.Date(hpc$Date,"%d/%m/%Y")<= as.Date("02/02/2007", "%d/%m/%Y")),]
  hpc1<- mutate(hpc1, Global_active_power=as.numeric(as.character(Global_active_power)),
              Sub_metering_1=as.numeric(as.character(Sub_metering_1)),
              Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
  hpc1<- mutate(hpc1, Date_Time=dmy_hms(paste(hpc1$Date,hpc1$Time)))
  
  png(file="plot3.png")
  
  with(hpc1, plot(hpc1$Date_Time, hpc1$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering"))
  with(hpc1, points(hpc1$Date_Time, hpc1$Sub_metering_2, type="l", col="red"))
  with(hpc1, points(hpc1$Date_Time, hpc1$Sub_metering_3, type="l", col="blue"))
  legend("topright",pch="l",col=c("black", "blue", "red"), legend=c("Sub_metring_1", "Sub_metring_2","Sub_metring_3"))
  dev.off()
}