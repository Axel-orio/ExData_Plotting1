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
energia <- read.table("./data/household_power_consumption.txt",skip=1,sep=";")
names(energia) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3")
subener <- subset(energia,energia$Date=="1/2/2007" | energia$Date =="2/2/2007")

?strptime
?plot

#Realizamos serie de tiempo
plot(strptime(paste(subener$Date, subener$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
     as.numeric(subener$Global_active_power), type = "l", xlab = "",
     ylab="Global Active Power (kilowatts)" )
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() 
