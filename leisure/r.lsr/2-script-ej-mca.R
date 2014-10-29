require(ade4)

oci.acm1_en<-dudi.acm(oci_en, scannf= FALSE, nf = 3, row.w=ej12_6$Pes)
#inertia.dudi(oci.acm1_en, col.inertia=T)
# representacio grafica dels indicadors
# amb fletxes
scatter.dudi(oci.acm1_en)
s.arrow(oci.acm1_en$co, xax=1, yax=2, boxes=F, clabel=0.75, grid=F, possub="topleft", sub="Dimensions 1 i 2") 
oci.acm1_en.co13<-oci.acm1_en$co[,c(1,3)]
s.arrow(oci.acm1_en.co13, boxes=F, clabel=0.75, grid=F, possub="topleft", sub="Dimensions 1 i 3")
oci.acm1_en.co23<-oci.acm1_en$co[,c(2,3)]
s.arrow(oci.acm1_en.co23, boxes=F, clabel=0.75, grid=F, possub="topleft", sub="Dimensions 2 i 3")£
#plot supplementary variables
s.arrow(supcol(dudi1, data.frame(scalewt(doubs$env)))$cosup,
        add.p = TRUE, clab = 2)

#Plot with ggplot2

require(ggplot2)

cats=apply(oci_en, 2, function(x) nlevels(as.factor(x)))
oci.acm1_en.gg<-data.frame(oci.acm1_en$co, Variable=rep(names(cats),cats))
ggplot(data=oci.acm1_en.gg, aes(x=Comp1, y=Comp2, label=rownames(oci.acm1_en.gg))) + geom_hline(yintercept=0, colour="gray70") + geom_vline(xintercept=0, colour="gray70") + geom_text(aes(colour=Variable)) + ggtitle("MCA dim 1 i 2")
ggplot(data=oci.acm1_en.gg, aes(x=Comp1, y=Comp3, label=rownames(oci.acm1_en.gg))) + geom_hline(yintercept=0, colour="gray70") + geom_vline(xintercept=0, colour="gray70") + geom_text(aes(colour=Variable)) + ggtitle("MCA dim 1 i 3")

ggplot(data=oci.acm1_en.gg, aes(x=Comp2, y=Comp3, label=rownames(oci.acm1_en.gg))) + geom_hline(yintercept=0, colour="gray70") + geom_vline(xintercept=0, colour="gray70") + geom_text(aes(colour=Variable)) + ggtitle("MCA dim 2 i 3")