# load the data
# note... skipping lines skips the header, so it seems
     src <- "./raw_data/household_power_consumption.txt"
     use_lines <- grep("^[12]/2/2007",readLines(src))
     pcd <- read.table(src, sep=";", header=T, skip=(use_lines[1]-1), nrows=(length(use_lines)-1))
     colnames(pcd) <- c("date","time","active_power","reactive_power","voltage","intensity","submeter_1","submeter_2","submeter_3")
     # under other circumstances, I would make a library to do this part
     # rather than duplicate it across four separate files... BUT...

# massage the data
     pcd$date <- strptime(paste(pcd$date,pcd$time),"%d/%m/%Y %H:%M:%S")

# save the file to PNG
     png(filename="plot3.png", width=480, height=480, units="px")
     plot(pcd$date, pcd$submeter_1, ylab="Energy Sub Metering", xlab="", type="l")
     lines(pcd$date, pcd$submeter_2, col="red")
     lines(pcd$date, pcd$submeter_3, col="blue")
     dev.off()