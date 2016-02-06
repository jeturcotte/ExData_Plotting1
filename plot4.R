# load the data
     src <- "./raw_data/household_power_consumption.txt"
     use_lines <- grep("[12]/2/2007",readLines(src))
     pcd <- read.table(src, sep=";", header=T, skip=use_lines[1], nrows=length(use_lines))
     # under other circumstances, I would make a library to do this part
     # rather than duplicate it across four separate files... BUT...
     
# save the file to PNG
     png(filename="plot4.png")
     # create the plot
     dev.off()