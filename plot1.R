
df <-read.delim("./Rdata/household_power_consumption.txt", header = T, sep = ";",na.strings="?" ) #, nrows=20 ) 
df<-df[ "1/2/2007"==df$Date | "2/2/2007"==df$Date,]
nrow(df)

df$Date <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df$Time<-NULL
head(df)
##### df<-df[ as.POSIXlt("2007-02-01") <= df$Date & df$Date <= as.POSIXlt("2007-02-02"), ]
#df<-df[complete.cases(df),]
nrow(df) 

tail(df)
str(df)

#?plot ?hist ?par ?dev.copy2pdf ?lines

################
png(file = "plot1.png",    width = 480, height = 480)
hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
################