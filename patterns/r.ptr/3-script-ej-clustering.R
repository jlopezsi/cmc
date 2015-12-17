#mclust package
library(mclust)
oci_en.Mclust <- Mclust(oci.acm1_en$li, G=4)
a<-summary(oci_en.Mclust.0, parameter=T)
print(a)
plot(oci_en.Mclust, what = c("BIC"))
pdf('figure2.pdf')
plot(oci_en.Mclust, what = c("classification"))
dev.off()

library(plyr)
dt <- data.frame(oci.acm1_en$li,group=oci_en.Mclust$classification)
ddply(dt,~group,summarise,mean=mean(Axis1),sd=sd(Axis1))
ddply(dt,~group,summarise,mean=mean(Axis2),sd=sd(Axis2))
ddply(dt,~group,summarise,mean=mean(Axis3),sd=sd(Axis3))


#xtabs(~Discoteca+c1+c12f_2)

#ftable(xtabs(~Discoteca+c1+c12f_2))
#descr(Discoteca)
names(oci_en)
crosstab(oci_en$gcl, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci_en$rnv, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci_en$spt, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci_en$spt, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci_en$nlf, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci_en$toc, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci_en$hkt, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci_en$pvg, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
#crosstab(Discoteca, c12f_2, weight=Pes)
library(ade4)
# con mclust

pdf("figure2a.pdf")
par(mfrow = c(2,2))
plot(oci_en.Mclust, what = c("BIC"))
coul <- c("black", "red", "green", "blue")
s.class(oci.acm1_en$li, as.factor(oci_en.Mclust$classification), cellipse = 2, col=coul, possub="topleft", sub="Dimensions 1 i 2")
s.class(oci.acm1_en$li[,c(1,3)], as.factor(oci_en.Mclust$classification), possub="topleft", col=coul, sub="Dimensions 1 i 3")
s.class(oci.acm1_en$li[,c(2,3)], as.factor(oci_en.Mclust$classification), col=coul, possub="topleft", sub="Dimensions 2 i 3")
dev.off()
par(mfrow = c(1,1))
#########
# 3d plots with made4
source("http://bioconductor.org/biocLite.R")
biocLite("made4")
library(made4)
pdf('figure2b.pdf')
do3d(oci.acm1_en$li, classvec=as.factor(oci_en.Mclust$classification), angle=60, classcol=c("black", "red", "green", "blue"))
dev.off()
do3d(oci.acm1_en$li, col="blue")


do3d(khan.coa$co, col="blue")
rotate3d(khan.coa$co,classvec=khan$train.classes)
khan.bga<-bga(khan$train, khan$train.classes)
plot.new()
par(bg="black")
do3d(khan.bga$bet$ls, classvec=khan$train.classes)

require(descr)
require(xtable)
names(oci.ilu1_en)

pdf("figure3z.pdf")
par(mfrow = c(3,2))
genre.ct <- xtable(crosstab(oci_en.Mclust$classification, oci.ilu1_en$Genre, xlab="Genre", ylab="Pattern", prop.r = T, weight=ej12_8$Pes))
age.ct <- crosstab(oci_en.Mclust$classification, oci.ilu1_en$Age, xlab="Age", ylab="Pattern", prop.r = T, weight=ej12_8$Pes)
education.ct <- crosstab(oci_en.Mclust$classification, oci.ilu1_en$YEducation,   xlab="Education", ylab="Pattern", prop.r = T, weight=ej12_8$Pes)
occupation.ct <- crosstab(oci_en.Mclust$classification, oci.ilu1_en$Occupation,   xlab="Occupation", ylab="Pattern",prop.r = T, weight=ej12_8$Pes)
language.ct <- crosstab(oci_en.Mclust$classification, oci.ilu1_en$Language,  xlab="Language", ylab="Pattern", prop.r = T, weight=ej12_8$Pes)
parentsEducation.ct <- crosstab(oci_en.Mclust$classification, oci.ilu1_en$PEducation,  xlab="Parents Education", ylab="Pattern", prop.r = T, weight=ej12_8$Pes)
dev.off()
par(mfrow = c(1,1))

sizeTown.ct <- crosstab(oci.ilu1_en$SizeTown, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
region.ct <- crosstab(oci.ilu1_en$Region, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)

crosstab(oci.ilu1_en$ParentsBirth, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
crosstab(oci.ilu1_en$Spain, oci_en.Mclust$classification, prop.r = T, weight=ej12_8$Pes)
methods(xtable)

