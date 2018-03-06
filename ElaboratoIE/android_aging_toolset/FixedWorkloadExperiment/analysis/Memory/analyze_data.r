require("Kendall")
require("zyp")

plotCollectedData <- function(name,m){
	cat('\nAnalyzing csv',name)
	print(col)
	n <- nrow(m)

	cat('The ',name,'csv has',n,'rows')
	for(r in 1:nrow(m)){
		x <- c(2:ncol(m))
		v <- as.numeric(m[r,x])
	if (ncol(m) >9){
		res <- MannKendall(v)
	cat('The ',name,'csv has',ncol(m),'columns')
	cat('The ',r,'th element of the first column (m[r,1]) is ',m[r,1])
	y <- c(1:(ncol(m)-1))
	slope <- zyp.sen(v~y)
	print('The calculated slope is')
	print(slope)
	print('The MannKendall Test returned:')
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
