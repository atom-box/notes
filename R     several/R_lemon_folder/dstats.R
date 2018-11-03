# dstats calculates the means, variances and valid ns for the
# numeric columns of the matrix or data frame x
# It returns an object of class "dstat", a matrix that looks like:
#			name1	name2	...
#	Mean		mean1	mean2	...
#	Variance	var1	var2	...
#	Valid n		n1	n2	...

dstats<-function(x,indices=1:dim(x)[2]) {
 if(!missing(x)) {
  if(is.data.frame(x) | is.matrix(x)) {
# include only numeric components, exclude factors
   indices<-sapply(x[indices],is.numeric)
   d1<-sapply(x[,indices],mean,na.rm=TRUE)
   d2<-sapply(x[,indices],var,na.rm=TRUE)
   d3<-sapply(x[,indices],validn)
   dstat<-(rbind(d1,d2,d3))
   rownames(dstat)<-c("Mean","Variance","n")
   class(dstat)<-"dstat"
   return(dstat)
  }
 }
 cat("Usage: dstats(x, indices=1:dim(x)[2])\n")
 cat("\twhere x is a data frame or matrix\n")
}

