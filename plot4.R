plot4 <- function(){
  library(dplyr)
  library(lubridate)
  hpc <- read.csv("../data/household_power_consumption.txt", sep=";", header=TRUE)
  hpc1<- hpc[(as.Date(hpc$Date,"%d/%m/%Y")>= as.Date("01/02/2007", "%d/%m/%Y"))&(as.Date(hpc$Date,"%d/%m/%Y")<= as.Date("02/02/2007", "%d/%m/%Y")),]
  hpc1<- mutate(hpc1, Global_active_power=as.numeric(as.character(Global_active_power)),
                Global_reactive_power=as.numeric(as.character(Global_reactive_power)),
              Sub_metering_1=as.numeric(as.character(Sub_metering_1)),
              Sub_metering_2=as.numeric(as.character(Sub_metering_2)),
              Voltage = as.numeric(as.character(Voltage)))
  hpc1<- mutate(hpc1, DateTime=dmy_hms(paste(hpc1$Date,hpc1$Time)))
  
  png(file="plot4.png")
  par(mfcol=c(2,2))
  
  with(hpc1, plot(hpc1$DateTime, hpc1$Global_active_power, type="l", xlab="", ylab="Global Active Power(Kilowatts"))
  
  with(hpc1, plot(hpc1$DateTime, hpc1$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering"))
  with(hpc1, points(hpc1$DateTime, hpc1$Sub_metering_2, type="l", col="red"))
  with(hpc1, points(hpc1$DateTime, hpc1$Sub_metering_3, type="l", col="blue"))
  legend("topright",pch="l",col=c("black", "blue", "red"), legend=c("Sub_metring_1", "Sub_metring_2","Sub_metring_3"))

  with(hpc1, plot(hpc1$DateTime, hpc1$Voltage, type="l", xlab="DateTime", ylab="Voltage"))

  with(hpc1, plot(hpc1$DateTime, hpc1$Global_reactive_power, type="l", xlab="DateTime", ylab="Global Reactive Power(Kilowatts)"))
  
  dev.off()

}