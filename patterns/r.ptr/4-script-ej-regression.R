
data <- cbind(as.factor(oci_en.Mclust$classification), oci.ilu1_en)
names(data)
nombres <- names(data)
nombres[1] <- "Pattern"
nombres
names(data)<- nombres
names(data)
class(data)

#estimation of individual logit models
data.dummies<-data
class(data.dummies)

data.dummies$One<-ifelse(data.dummies$Pattern == "1", 1, 0)
data.dummies$Two<-ifelse(data.dummies$Pattern == "2", 1, 0)
data.dummies$Three<-ifelse(data.dummies$Pattern == "3", 1, 0)
data.dummies$Four<-ifelse(data.dummies$Pattern == "4", 1, 0)
str(data.dummies)
oci.one.b<-glm(One~Genre*YEducation+SizeTown+Age*YEducation+Language*PEducation+Region, weights=ej12_8$Pes, family = binomial(logit), data=data.dummies)
library(Zelig)

oci.one.z<-zelig(One~Genre*YEducation+SizeTown+Age*YEducation+Language*PEducation+Region,  weights= ej12_8$Pes,  model = "logit", data=data.dummies)
print(oci.one.z)
oci.two.z<-zelig(Two~Genre*YEducation+SizeTown+Age*YEducation+Language*PEducation+Region,  weights= ej12_8$Pes,  model = "logit", data=data.dummies)
print(oci.two.z)
oci.three.z<-zelig(Three~Genre*YEducation+SizeTown+Age*YEducation+Language*PEducation+Region,  weights= ej12_8$Pes,  model = "logit", data=data.dummies)
oci.four.z<-zelig(Four~Genre*YEducation+SizeTown+Age*YEducation+Language*PEducation+Region,  weights= ej12_8$Pes,  model = "logit", data=data.dummies)


library(stargazer)
stargazer(oci.one.z, oci.two.z, oci.three.z, oci.four.z, no.space = TRUE, type='text',  title="Regression")
stargazer(oci.one.z, type ='text')
stargazer(oci.two.z, type ='text')
stargazer(oci.three.z, type ='text')
stargazer(oci.four.z, type ='text')


###Estimation of glm models
data.f <- as.data.frame(ftable(data, col.var="Pattern"))
#names(data.f)
#class(data.f)

#data.t <- xtabs(~., data=data)
#data.f
#data.t
#head(data.f, 10)
#source("http://bioconductor.org/biocLite.R")
#biocLite("RBGL")
#source("http://bioconductor.org/biocLite.R")
#biocLite("Rgraphviz")
#source("http://bioconductor.org/biocLite.R")
#biocLite("graph")
#library(gRbase, gRim )
#m0<- dmod(~.^., data=data)
#m.final <- stepwise(m0, k=2)
#texreg(m.final)
#coefficients(m.final)
#m.final2<- stepwise(m0)
#plot(m.final)

#m4.loglm <- loglm(Pattern ~ Genre*Education+SizeTown+Age*Education+Language*ParentsEducation+Region, weights=ej12_8$Pes, data=data)
#mtable(m4.loglm)
m4.glm <- glm(Freq ~ -1 + Pattern*Genre*Education+Pattern*SizeTown+Pattern*Age*Education+Pattern*Language*ParentsEducation+Pattern*Region, family=poisson(link="log"), data=data.f)
#m4b.glm <- glm(Pattern ~ -1 + Genre*Education+SizeTown+Age*Education+Language*ParentsEducation+Region, family=poisson(link="log"), weight = Freq, data=data.f)


summary(m4.glm)
#stargazer(m4.glm, type = "text")
#textreg(m4.glm)

names(oci.ilu1_en)
library(nnet)
#class<-as.factor(oci_en.Mclust$classification)
#levels(class)
#class<-factor(class, levels = c(4, 1, 2, 3))
#levels(class)
oci.mn0<-multinom(as.factor(oci_en.Mclust$classification)~1, weights=ej12_8$Pes, data=oci.ilu1_en)
oci.mn0b<-multinom(as.factor(oci_en.Mclust$classification)~SizeTown+Region, weights=ej12_8$Pes, data=oci.ilu1_en)
oci.mn1<-multinom(as.factor(oci_en.Mclust$classification)~Genre+Age+YEducation+PEducation+SizeTown+Region, weights=ej12_8$Pes, data=oci.ilu1_en)
#oci.mn2b<-multinom(as.factor(oci_en.Mclust$classification)~Genre+Age+Language*ParentsEducation, weights=ej12_8$Pes, data=oci.ilu1_en)
oci.mn2<-multinom(as.factor(oci_en.Mclust$classification)~Genre+Age*PEducation+YEducation+Region+SizeTown, weights=ej12_8$Pes, data=oci.ilu1_en)
#oci.mn3<-multinom(as.factor(oci_en.Mclust$classification)~Genre+Age+Language*ParentsEducation+Education*Age, weights=ej12_8$Pes, data=oci.ilu1_en)
oci.mn3<-multinom(as.factor(oci_en.Mclust$classification)~Genre*PEducation+YEducation+PEducation*Age+Region+SizeTown, weights=ej12_8$Pes, data=oci.ilu1_en)
#oci.mn3c<-multinom(as.factor(oci_en.Mclust$classification)~Genre+ParentsEducation*Age, weights=ej12_8$Pes, data=oci.ilu1_en)
classes<-as.factor(oci_en.Mclust$classification)
classes <-relevel(classes, "4")
oci.mn4<-multinom(classes~YEducation+Genre*PEducation+SizeTown+Age*PEducation+Language*PEducation+Region, weights=ej12_8$Pes, data=oci.ilu1_en)

oci.mn.one<-multinom(One~YEducation+Genre*PEducation+SizeTown+Age*PEducation+Language*PEducation+Region, weights=ej12_8$Pes, data=data.dummies)
oci.mn.two<-multinom(Two~YEducation+Genre*PEducation+SizeTown+Age*PEducation+Language*PEducation+Region, weights=ej12_8$Pes, data=data.dummies)
oci.mn.three<-multinom(Three~YEducation+Genre*PEducation+SizeTown+Age*PEducation+Language*PEducation+Region, weights=ej12_8$Pes, data=data.dummies)
oci.mn.four<-multinom(Four~YEducation+Genre*PEducation+SizeTown+Age*PEducation+Language*PEducation+Region, weights=ej12_8$Pes, data=data.dummies)

#oci.mn44<-multinom(class~Genre*Education+SizeTown+Age*Education+Language*ParentsEducation+Region, weights=ej12_8$Pes, data=oci.ilu1_en)
#library(MASS)
#oci.loglm <- loglm(~class+Genre*Education+SizeTown+Age*Education+Language*ParentsEducation+Region, weights=ej12_8$Pes, data=oci.ilu1_en)
#oci.stepaic <- stepAIC(oci.mn44, direction = 'forward')
#oci.stepaic$anova
#library(ZeligChoice)
#oci.zelig <- zelig (oci_en.Mclust$classification)~Genre+Age, model = "mlogit", weights=ej12_8$Pes, data=oci.ilu1_en)
#library(MASS)
#oci.lda<-lda(as.factor(oci_en.Mclust$classification)~Genre+Age, weights=ej12_8$Pes, data=oci.ilu1_en)
#oci.lda1<-lda(as.factor(oci_en.Mclust$classification)~ParentsEducation*Genre+Age, weights=ej12_8$Pes, data=oci.ilu1_en)
#summary(oci.lda)
#plot(oci.lda)

#library(klaR)
#partimat(as.factor(oci_en.Mclust$classification)~Genre+Age, weights=ej12_8$Pes, data=oci.ilu1_en,method="lda")

#oci.loglm1<-loglm(as.factor(oci_en.Mclust$classification)~Genre+Age,  weights=ej12_8$Pes, data=oci.ilu1_en)
#summary(oci.loglm1, Wald=T)
#names(oci.loglm1)
#oci.loglm1$terms

summary(oci.mn1)
oci.mn0.sum<-summary(oci.mn0)
oci.mn1.sum<-summary(oci.mn1)
oci.mn2.sum<-summary(oci.mn2)
oci.mn2b.sum<-summary(oci.mn2b)
oci.mn3.sum<-summary(oci.mn3)
oci.mn3b.sum<-summary(oci.mn3b)
oci.mn4.sum<-summary(oci.mn4)
summary(oci.mn0, Wald=TRUE)
summary(oci.mn1, Wald=TRUE)
summary(oci.mn2, Wald=TRUE)
summary(oci.mn2b, Wald=TRUE)
summary(oci.mn3, Wald=TRUE)
summary(oci.mn3b, Wald=TRUE)
summary(oci.mn4, Wald=TRUE)

#table selection models
#install.packages('AICcmodavg', repos = NULL, type = 'source')
library(AICcmodavg)
Cand.mds <- list(oci.mn0, oci.mn0b, oci.mn1)
Modnames <- c('M0', 'M0b', 'M1')
##compute table
aictab(cand.set = Cand.mds, modnames = Modnames,
       second.ord = TRUE, nobs= NULL, sort = TRUE)
#Cand.mds <- list(oci.mn2, oci.mn3, oci.mn4)
Cand.mds <- list(oci.mn2, oci.mn3)

#Modnames <- c('M2', 'M3', 'M4')
Modnames <- c('M2', 'M3')
##compute table
aictab(cand.set = Cand.mds, modnames = Modnames,
       second.ord = TRUE, nobs= NULL, sort = TRUE)
#Esto genera tablas muy bonitas pero en formato latex
read.table("model.selection.txt")

library(stargazer)
anova(oci.mn0, oci.mn0b)
anova(oci.mn0b, oci.mn1)
stargazer(anova(oci.mn0b, oci.mn1), no.space = TRUE, type='text',  title="Resting models 0 & 1")
anova(oci.mn1, oci.mn2)
stargazer(anova(oci.mn1, oci.mn2), no.space = TRUE, type='text',  title="Resting models 1 & 2")
stargazer(anova(oci.mn2, oci.mn2b), no.space = TRUE, type='text',  title="Resting models 2 & 2b")
anova(oci.mn2, oci.mn3)
stargazer(anova(oci.mn2, oci.mn3), no.space = TRUE, type='text',  title="Resting models 2 & 3")
stargazer(anova(oci.mn2, oci.mn3b), no.space = TRUE, type='text',  title="Resting models 2 & 3b")
stargazer(anova(oci.mn3, oci.mn3b), no.space = TRUE, type='text',  title="Resting models 3 & 3b")
anova(oci.mn3, oci.mn4)
stargazer(oci.mn.one, oci.mn.two, oci.mn.three, oci.mn.four, no.space = TRUE, type='text',  title="Resting models 3 & 4")

stargazer(oci.mn1, oci.mn2, oci.mn3, no.space = TRUE, type='text',  title="Regression Results ")
stargazer(oci.mn0b, no.space = TRUE,  type='text',  title="Regression Results M1")
stargazer(oci.mn1, no.space = TRUE,  type='text',  title="Regression Results M1")
stargazer(oci.mn2, no.space = TRUE, type='text', title="Regression Results M2")
stargazer(oci.mn2b, no.space = TRUE, type='text', title="Regression Results M2b")
stargazer(oci.mn3, no.space = TRUE, type='text',  title="Regression Results M3")
stargazer(oci.mn3b, no.space = TRUE, type='text',  title="Regression Results M3b")
stargazer(oci.mn4, no.space = TRUE, out = "m4new.pdf", title="Regression Results M4")
stargazer(oci.mn4, no.space = TRUE, type='text',  title="Regression Results M4")


coef.vector<-exp(coef(oci.mn44))
coef.vector4<-exp(coef(oci.mn4))
coef.vector44
head(coef.vector4)

#stargazer(oci.mn44,coef=list(coef.vector), no.space = TRUE, type='text',  title="Regression Results M4")
#library(pander)
#model<-stargazer(oci.mn4, type = 'text', no.space = TRUE,  title="Regression Results M4")

#pander(model)
#stargazer(oci.loglm1, no.space = TRUE,  type='text',  title="Loglm Results M1")


#library(car)
#library(splines)
#library(effects)
#language.education <- effect("Language*Education", oci.mn2)
#plot(language.education)

#vgam
#library(VGAM)
#citation('VGAM')
#oci.mn.vgam1<-vgam(as.factor(oci_en.Mclust$classification) ~Genre+Age, data=oci.ilu1_en, multinomial(refLevel = 1))
#oci.mn.vgam2<-vgam(as.factor(oci_en.Mclust$classification) ~Genre+Age+Language*Education, data=oci.ilu1_en, multinomial(refLevel = 1))
#oci.mn.vgam3<-vgam(as.factor(oci_en.Mclust$classification) ~Genre+Age+ParentsEducation+Language*Education, data=oci.ilu1_en, weights=ej12_8$Pes, multinomial(refLevel = 1))
#anova(oci.mn.vgam1, oci.mn.vgam2)
#anova(oci.mn.vgam2, oci.mn.vgam3)
#summary(oci.mn.vgam1)
#names(oci.mn.vgam1)
#oci.mn4<-multinom(as.factor(oci_en.Mclust$classification)~Genre*Education+SizeTown+Age*Education+Language*ParentsEducation+Region, weights=ej12_8$Pes, data=oci.ilu1_en)
#oci.mn.vgam4 <- vgam(as.factor(oci_en.Mclust$classification)~Genre*Education+SizeTown+Age*Education+Language*ParentsEducation+Region, weights=ej12_8$Pes, data=oci.ilu1_en, multinomial(refLevel = "last"))
#library(stargazer)
#stargazer(oci.mn.vgam4, no.space = TRUE, type='text',  title="Regression Results M4")
#summary(oci.mn.vgam4)
#coef(summary(oci.mn.vgam4), matrix = T)
#prob(summary(oci.mn.vgam4), matrix = T)
#library(texreg)
#print(oci.mn.vgam4)
#library(memisc)
#mtable(oci.mn4)
#oci.mn.vgam3
