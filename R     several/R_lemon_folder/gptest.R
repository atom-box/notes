# group.prop.test calculates the proportions of event (non-zero)
# and no-event (0) values in groups defined by the values in "by"
# on the variable "datavec".
# It performs a test of significance on the null hypothesis that
# each group has the same proportion of events as all groups combined. 
# That is, no group proportion is significantly different from the 
# overall mean proportion.
# It returns a list of the frequencies of events, group numbers 
# and observed probabilities for each group.

group.prop.test<-function(datavec,by,method="bonferroni",...) {
 if(!missing(datavec) && !missing(by)) {
  by.factor<-as.factor(by)
  nstats<-length(levels(by.factor))
  gptest<-
   list(group=rep(" ",nstats),present=rep(0,nstats),
    n=rep(0,nstats),p.value=rep(0,nstats))
  gptest$group<-levels(by.factor)
  overall.prop<-sum(datavec>0,na.rm=T)/length(datavec)
  for(i in 1:nstats) {
   groupdata<-subset(datavec,by == gptest$group[i])
   gptest$present[i]<-sum(groupdata>0)
   gptest$n[i]<-length(groupdata)
   gptest$p.value[i]<-
    p.adjust(prop.test(gptest$present[i],n=gptest$n[i],p=overall.prop)$p.value,
     n=nstats,method=method,...)
  }
  gptest$group<-format(gptest$group)
  cat("\nTest of group proportions against overall proportion\n\n")
  cat("overall proportion =",overall.prop,"\n\n")
  cat("Group        Present       n           p\n")
  for(i in 1:nstats) {
   cat(gptest$group[i],formatC(gptest$present[i],10))
   cat(formatC(gptest$n[i],8),formatC(round(gptest$p.value[i],4),10),"\n")
  }
  invisible(gptest)
 }
 else cat("Usage: group.prop.test(datavec,by,method=\"bonferroni\",)\n")
}
