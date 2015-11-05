
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
png(file = "plot3.png",    width = 480, height = 480)
with(df, plot( Date,Sub_metering_1, type='n',ylab="Energy sub metering",xlab=""))
# with( subset(df,month=5), lines(x,y,col="blue"))
with(df, lines(Date,Sub_metering_1, type='l',col="black"))
with(df, lines(Date,Sub_metering_2, type='l',col="red"))
with(df, lines(Date,Sub_metering_3, type='l',col="blue"))
legend("topright", pch = 19, 
	col=c("black","red","blue" ) , 
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.off()
################