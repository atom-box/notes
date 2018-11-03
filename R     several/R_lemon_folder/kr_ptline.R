# add.pointline adds points, lines or both to an existing plot
# from the information in the "dstat" (see "dstats") object y.

add.pointline<-function(x,y,ylim,pch=1,col=1,errbars=F,type="b",xoffset) {
 if(!missing(x)) {
  if(missing(y)) {
   y<-x
   x<-1:length(y[1,])+xoffset
  }
 }
 if(!is.null(class(y)) && class(y) == "dstat") {
  if(missing(ylim)) ylim<-par("usr")[3:4]
  points(x,y[1,],type=type,pch=pch,col=col)
  if(errbars == T) error.bars(x,y,ylim=ylim,col)
 }
 else
  cat("Usage: add.pointline(y[, ylim, pch, col, errbars = F])\n\twhere y is a 'dstat' object.\n")
}

# error.bars adds error bars to an existing plot.

error.bars<-function(x,y,ylim,col=1) {
 if(!missing(x)) {
  if(missing(y)) {
   y<-x
   x<-rep(1:length(y[1,]),2)
  }
 }
 if(class(y) == "dstat") {
  stderr<-y[2,]^0.5/y[3,]^0.5
  if(missing(ylim))
   ylim<-c(min(y[1,]-stderr),max(y[1,]+stderr))
  else x<-as.vector(x)
  gap<-strheight("m")
  # x may be a matrix
  upy0<-y[1,]+gap
  downy0<-y[1,]-gap
  upy1<-y[1,]+stderr
  downy1<-y[1,]-stderr
  arrows(x,c(upy0,downy0),x,c(upy1,downy1),length=0.1,angle=90,col=col)
 }
 else {
  cat("Usage: error.bars(y[, ylim])\n")
  cat("\twhere x is the horizontal position of the bars, y is a 'dstat' object\n")
  cat("\tand ylim is the vertical extent of the data\n")
 }
}

pointline.plot<-function(x,y,ylim,plot.labels=NULL,xtick.labels=NULL,
 ytick.labels=NULL,errbars=FALSE,col=1,pch=1,...) {
 
 if(missing(y)) {
  y<-x
  x<-1:length(y[1,])
 }
 if(!is.null(class(y)) && class(y) == "dstat") {
  if(is.null(plot.labels)) {
   plot.labels<-list(title="",xlab="",ylab="")
   plot.labels$title <- readline("Title - ")
   plot.labels$xlab <- readline("X axis label - ")
   plot.labels$ylab <- readline("Y axis label - ")
  }
  if(is.null(xtick.labels)) xtick.labels = colnames(y)
  x.limits<-c(0.5,length(y[1,])+0.5)
  stderr<-y[2,]^0.5/y[3,]^0.5
  if(missing(ylim)) y.limits<-c(min(y[1,]-stderr),max(y[1,]+stderr))
  else y.limits<-ylim
  plot(y[1,],main=plot.labels$title,xlab=plot.labels$xlab,ylab=plot.labels$ylab,
   type="b",xaxt="n",yaxt="n",xlim=x.limits,ylim=y.limits,pch=pch,...)
  axis(1,1:length(y[1,]),xtick.labels)
  if(is.null(ytick.labels)) axis(2)
  else axis(2,1:length(ytick.labels),ytick.labels)
  if(errbars == T) error.bars(x,y,ylim=y.limits,col=col)
 }
 else
  cat("Usage: pointline.plot([x, ]y[, ylim, axis.labels=NULL, errbars = FALSE, col=1, pch=1, ...])\n\twhere y is a 'dstat' object\n")
}

plot.dstat<-function(y,ylim,plot.labels=NULL,tick.labels=NULL,errbars=FALSE,
 pch=1:length(y),col=1:length(y),legend=F,offset=F) {
 
 if(!is.null(class(y)) && class(y) == "dstat") {
  if(missing(ylim)) ylim<-get.dstat.ylim(y)
  if(is.list(y) && class(y[[1]]) == "dstat") {
   pointline.plot(y[[1]],ylim=ylim,plot.labels=plot.labels,
    xtick.labels=tick.labels,errbars=errbars,col=col[1],pch=pch[1])
   for(i in 2:length(y)) {
    if(errbars || offset) xofs<-strwidth("m")
    else xofs<-0
    add.pointline(y[[i]],ylim=ylim,errbars=errbars,col=col[i],pch=pch[i],
     xoffset=(xofs*floor(i/2))*((floor(i/2) == i/2)*2-1))
   }
   if(legend) {
    cat("Left-click at the top left corner of the legend\n",file=2)
    legendpos<-locator(1)
    legend(legendpos$x,legendpos$y,legend=names(y),pch=pch,col=col)
   }
  }
  else {
   pointline.plot(y,ylim=ylim,plot.labels=plot.labels,
    xtick.labels=tick.labels,errbars=errbars,col=col[1],pch=pch[1])
   if(legend) {
    cat("Left-click at the top left corner of the legend\n",file=2)
    legendpos<-locator(1)
    legend(legendpos$x,legendpos$y,legend=names(y),pch=pch,col=col)
   }
  }
 }
 else cat("Usage: plot.dstat(y[,ylim,labels=NULL,errbars=FALSE,pty,col,legend,offset])\n\twhere y is a 'dstat' object\n")
}

# a recursive function that finds the upper and lower limits of a dstat
# object, including the standard errors.
get.dstat.ylim<-function(y) {
 if(!is.null(class(y[[1]])) && class(y[[1]]) == "dstat") {
  for(i in 1:length(y)) {
   this.ylim<-get.dstat.ylim(y[[i]])
   if(exists("gdy",inherits=F)) {
    gdy[1]<-min(this.ylim[1],gdy[1])
    gdy[2]<-max(this.ylim[2],gdy[2])
   }
   else gdy<-this.ylim
  }
 }
 else {
  stderr<-y[2,]^0.5/y[3,]^0.5
  gdy<-c(min(y[1,]-stderr),max(y[1,]+stderr))
 }
 return(gdy)
}
