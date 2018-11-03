# freq displays a simple frequency table for a vector, or steps through
# the columns of a data frame or matrix and returns the result of tabulate()

freq<-function(x,labels,nbins,var.label,maxbins=10,width=8,show.pc=F) {
 if(!missing(x)) {
  if(is.null(dim(x))) {
   # see if there are any NAs
   nna<-sum(is.na(x))
   if(is.numeric(x)) {
    if(missing(labels)) {
     # tabulate drops categories for integers having no observations
     xrange<-range(na.omit(x))
     categories<-seq(xrange[1],xrange[2])
    }
    else categories<-labels
    # another serious kludge - tabulate() always starts at 1
    if(xrange[1] > 1) x<-x-(xrange[1]-1)
   }
   if(is.factor(x)) categories<-levels(x)
   # serious kludge to get around tabulate() shifting 0 values in factors
   if(categories[1] == "0") x<-x+1
   # get the variable label here or it might be clobbered
   if(missing(var.label)) var.label<-deparse(substitute(x))
   if(missing(nbins)) nbins<-length(categories)
   # this effectively clobbers the maxbins limit - try to fix
   if(nbins > maxbins) maxbins<-nbins
   if(length(categories) <= maxbins) {
    # if NAs present, tack on a label
    if(nna) categories<-c(categories,"NA")
    categories<-formatC(ifelse(categories=="","Missing",categories),width=width)
    cat("Frequencies for",var.label,"\n")
    cat(" ",categories,"\n")
    # tabulate barfs with NAs
    freqs<-tabulate(na.omit(x),nbins)
    # tack on the NA count
    if(nna) freqs<-c(freqs,nna)
    cat(" ",formatC(as.character(freqs),width=width),"\n")
    if(show.pc) {
     cat("%",formatC(as.character(round(100*freqs/sum(freqs),1)),width=width),"\n")
    }
    cat("\n")
    names(freqs)<-categories
    invisible(freqs)
   }
   else cat(length(categories),"categories exceeds maximum bins!\n")
  }
  else {
   nfreq<-dim(x)[2]
   freq.list<-rep(list(0),nfreq)
   var.labels<-names(x)
   for(i in 1:nfreq)
    freq.list[[i]]<-freq(x[,i],labels,nbins,var.labels[i],maxbins,width,show.pc)
   names(freq.list)<-names(x)
   invisible(freq.list)
  }
 }
 else cat("Usage: freq(x,labels=NULL,nbins,maxbins=10,width=10,show.pc=F)\n")
}
