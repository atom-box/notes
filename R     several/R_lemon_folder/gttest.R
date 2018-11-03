# performs a simple t-test between two groups defined by either two
# levels of the factor(or integer valued variable) groupvar or
# one level and all other levels.

group.t.test<-function(x,groupvar,groups,...) {
 if(!missing(x)) {
  if(!missing(groupvar)) {
   if(!missing(groups)) {
    group1<-subset(x,groupvar == groups[1])
    if(length(groups) == 1) group2<-subset(x,groupvar != groups[1])
    else group2<-subset(x,groupvar == groups[2])
    return(t.test(group1,group2,...))
   }
  }
 }
 cat("Usage: group.t.test(x,groupvar,groups,...)\n")
}
