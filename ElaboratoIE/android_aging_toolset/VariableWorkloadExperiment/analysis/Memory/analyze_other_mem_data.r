require("Kendall")
require("zyp")

plotCollectedData <- function(name,m){	
	n <- nrow(m)
    x <- c(1:nrow(m))
    v <- as.numeric(m[,1])
    slope <- zyp.sen(v~x)
    res <- MannKendall(v)
    #    print(res)
    if (nrow(m) >9){
            res <- MannKendall(v)
            print(name)
            print(slope$coefficients[1])
            print(slope$coefficients[2])
            
        }
		pdf(paste(name,'.pdf',sep=""))
		plot(x,v,type='p',ann=FALSE)
		
		MemInKB <- slope$coefficients[1]+slope$coefficients[2]*x
		lines(MemInKB~x,col="red")
		title(main=name,x="Sample",y="Amount of memory(KB)")
		dev.off()
	}

args <- commandArgs(trailingOnly = TRUE)
input_txt = read.table(args[1])  # read text file
plotCollectedData(args[1],input_txt)

