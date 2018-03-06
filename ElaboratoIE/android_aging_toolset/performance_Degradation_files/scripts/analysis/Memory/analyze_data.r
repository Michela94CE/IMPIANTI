require("Kendall")
require("zyp")

plotCollectedData <- function(name,m){	
	print(col)
	n <- nrow(m)
	
	print(n)
	for(r in 1:nrow(m)){
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
                        pdf(paste('Plots/',m[r,1],'.pdf',sep=""))
             plot(y,v,type='p',ann=FALSE)
        
                    MemInKB <- slope$coefficients[1]+slope$coefficients[2]*y
                    lines(MemInKB~y,col="red")
                    title(main=m[r,1],x="Sample",y="Amount of memory(KB)")
                    dev.off()
        
    }

	}
}
args <- commandArgs(trailingOnly = TRUE)
print(args)
input_csv <- read.csv(args[1],header=FALSE)
plotCollectedData(args[1],input_csv)
