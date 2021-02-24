#############################Semana 1########################################  

#############################Course project 1#########################


##########Preparacion###############
rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects.
gc() #free up memrory and report the memory usage.
### Setup ----
Sys.setlocale("LC_ALL", "Spanish_Mexico.1252") # Cambiar locale para prevenir problemas con caracteres especiales
options(scipen=999) # Prevenir notacion cientifica



#Definimos el directorio
setwd("~/Coursera/Exploratory Data Analysis/Semana 1/Project")

###########Ejercicio 1##############
if (!file.exists("data")){
  dir.create("data")
}

#Cargar y limpiar base de consumo de energia
energia <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", 
                      stringsAsFactors = FALSE, dec = ".")

subener <- energia[energia$Date %in% c("1/2/2007","2/2/2007") ,]

par(mfrow = c(2, 2))

#Realizamos la gráfica 1
plot(strptime(paste(subener$Date, subener$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
     as.numeric(as.character(subener$Global_active_power)), type = "l", xlab = "",
     ylab="Global Active Power (kilowatts)" )

#Realizamos la gráfica 2
plot(strptime(paste(subener$Date, subener$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
     as.numeric(as.character(subener$Voltage)), type = "l", xlab = "datetime",
     ylab="Voltage" )

#Realizamos la gráfica 3
plot(strptime(paste(subener$Date, subener$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
     as.numeric(as.character(subener$Sub_metering_1)), type = "l", xlab = "", 
     ylab="Energy Sub Metering" )
lines(strptime(paste(subener$Date, subener$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
      as.numeric(as.character(subener$Sub_metering_2)), col = "red")
lines(strptime(paste(subener$Date, subener$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
      as.numeric(as.character(subener$Sub_metering_3)), col = "blue")
legend("topright", col = c("black", "red", "blue"), lty=1, cex = .75,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Realizamos la gráfica 4
plot(strptime(paste(subener$Date, subener$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
     as.numeric(as.character(subener$Global_reactive_power)), type = "l", xlab = "datetime",
     ylab="Global_reactive_power" )

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() 