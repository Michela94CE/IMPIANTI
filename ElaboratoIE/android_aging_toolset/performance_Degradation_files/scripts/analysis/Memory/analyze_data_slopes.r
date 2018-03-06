
require("Kendall")
require("zyp")

plotCollectedData <- function(name,m){	
    ##	print(col)
	n <- nrow(m)
	
	for(r in 1:nrow(m)){
        #	print(r)
		x <- c(2:ncol(m))
       v <- as.numeric(m[r,x])


if (ncol(m) >9){
    res <- MannKendall(v)

            print(ncol(m))
            print(m[r,1])
            y <- c(1:(ncol(m)-1))
            slope <- zyp.sen(v~y)
            print(slope)
            print(res)
        }
    }
}
args <- commandArgs(trailingOnly = TRUE)
input_csv <- read.csv(args[1],header=FALSE)
plotCollectedData(args[1],input_csv)
