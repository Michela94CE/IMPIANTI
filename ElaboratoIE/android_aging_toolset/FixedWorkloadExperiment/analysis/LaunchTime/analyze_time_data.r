require("Kendall")
require("zyp")

plotCollectedData <- function(name,m){	
	# print(col)
	n <- nrow(m)
	
	cat("Number of Samples: ", n)

	cat("\n ")

	x<- as.numeric(input_txt$V1)
	y<- as.numeric(input_txt$V2)

	slope <- zyp.sen(y~x)
	med <- median(y)
	perc <- quantile(y, c(.90))

	if (n > 9){
	    res <- MannKendall(y)
    	print(name)
    	print(slope)
    	filename=paste("Slopes", name, sep="/")
    	write("Slope", filename)
    	write(slope$coefficients[2], filename,  append=TRUE)
    	write("\np-value", filename, append=TRUE)
    	write(res$sl[1], filename, append=TRUE)
    	write("\nMedian", filename, append=TRUE)
    	write(med, filename, append=TRUE)
    	write("\n90-percentile", filename, append=TRUE)
    	write(perc, filename, append=TRUE)
	
	    pdf(paste('TimePlotsTemp/',name,'.pdf',sep=""))
	    plot(x,y,type='p',ann=FALSE)
	    
	    LaunchTimes <- slope$coefficients[1]+slope$coefficients[2]*x
	    lines(LaunchTimes~x,col="red")
	    title(main=name,x="Timestamp (ms)",y="Launch Time (ms)")
	    dev.off()
	}
}

args <- commandArgs(trailingOnly = TRUE)
input_txt = read.table(args[1])

plotCollectedData(args[1],input_txt)

