plot2 <- function(){
    full_hhpc <- read.csv("household_power_consumption.txt",header= TRUE,sep = ";",colClasses = "character", na.strings = "?")
    full_hhpc <- cbind(full_hhpc,data.frame(Datetime=strptime(paste(full_hhpc$Date, full_hhpc$Time), "%d/%m/%Y %H:%M:%S")))
    df<-tbl_df(full_hhpc)
    rm(full_hhpc)
    mut_df<-mutate(df,date_d = as.Date(Date,"%d/%m/%Y"))
    rm(df)
    fltrd_df <- filter(mut_df, date_d>=as.Date("2007-02-01"),date_d<=as.Date("2007-02-02"))
    png("plot2.png",height = 480, width = 480,bg="transparent" )
    plot(fltrd_df$Datetime,as.numeric(fltrd_df$Global_active_power),
         type = "l",
         col = "Black",
         xlab = "",
         ylab="Global Active Power (kilowatts)"
    )
    dev.off()
}
