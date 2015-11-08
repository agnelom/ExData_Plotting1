plot4 <- function(){
    full_hhpc <- read.csv("household_power_consumption.txt",header= TRUE,sep = ";",colClasses = "character", na.strings = "?")
    full_hhpc <- cbind(full_hhpc,data.frame(Datetime=strptime(paste(full_hhpc$Date, full_hhpc$Time), "%d/%m/%Y %H:%M:%S")))
    df<-tbl_df(full_hhpc)
    rm(full_hhpc)
    mut_df<-mutate(df,date_d = as.Date(Date,"%d/%m/%Y"))
    rm(df)
    fltrd_df <- filter(mut_df, date_d>=as.Date("2007-02-01"),date_d<=as.Date("2007-02-02"))
    png("plot4.png",height = 480, width = 480,bg="transparent")
    par(mfrow=c(2,2))
    plot(fltrd_df$Datetime,as.numeric(fltrd_df$Global_active_power),
         type = "l",
         col = "Black",
         xlab = "",
         ylab="Global Active Power"
    )

        plot(fltrd_df$Datetime,as.numeric(fltrd_df$Voltage),
         type = "l",
         col = "Black",
         xlab = "datetime",
         ylab="Voltage"
    )
    
    plot(fltrd_df$Datetime,as.numeric(fltrd_df$Sub_metering_1),
         type = "l",
         col = "Black",
         xlab = "",
         ylab="Energy sub metering"
    )
    points(fltrd_df$Datetime,
           fltrd_df$Sub_metering_2,
           type = "l",
           col = "Red",
           xlab = "",
           ylab="Energy sub metering"
    )
    points(fltrd_df$Datetime,
           fltrd_df$Sub_metering_3,
           type = "l",
           col = "Blue",
           xlab = "",
           ylab="Energy sub metering"
    )
    legend("topright", 
           lty = 1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    
    plot(fltrd_df$Datetime,as.numeric(fltrd_df$Global_reactive_power),
         type = "l",
         col = "Black",
         xlab = "datetime",
         ylab="Global_reactive_power"
    )
    dev.off()
}
