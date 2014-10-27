#mclust package
library(mclust)
oci_en.Mclust <- Mclust(oci.acm1_en$li)
a<-summary(oci_en.Mclust)
print(a)
plot(oci_en.Mclust, what = c("BIC"))
plot(oci_en.Mclust, what = c("classification"))

library(plyr)
dt <- data.frame(oci.acm1_en$li,group=oci_en.Mclust$classification)
ddply(dt,~group,summarise,mean=mean(Axis1),sd=sd(Axis1))
ddply(dt,~group,summarise,mean=mean(Axis2),sd=sd(Axis2))
ddply(dt,~group,summarise,mean=mean(Axis3),sd=sd(Axis3))

library(ade4)
# con mclust
coul <- c("black", "red", "green", "blue")
s.class(oci.acm1_en$li, as.factor(oci_en.Mclust$classification), cellipse = 2, col=coul, possub="topleft", sub="Dimensions 1 i 2")
s.class(oci.acm1_en$li[,c(1,3)], as.factor(oci_en.Mclust$classification), possub="topleft", col=coul, sub="Dimensions 1 i 3")
s.class(oci.acm1_en$li[,c(2,3)], as.factor(oci_en.Mclust$classification), col=coul, possub="topleft", sub="Dimensions 2 i 3")
#########