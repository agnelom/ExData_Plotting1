plot1 <- function(){
    
full_hhpc <- read.csv("household_power_consumption.txt",header= TRUE,sep = ";",colClasses = "character")
df<-tbl_df(full_hhpc)
rm(full_hhpc)
mut_df<-mutate(df,date_d = as.Date(Date,"%d/%m/%Y"))
rm(df)
fltrd_df <- filter(mut_df, date_d>=as.Date("2007-02-01"),date_d<=as.Date("2007-02-02"))
png("plot1.png",height = 480, width = 480,bg="transparent")
hist(as.numeric(fltrd_df$Global_active_power),
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    col = "Red"
    )
dev.off()
}
