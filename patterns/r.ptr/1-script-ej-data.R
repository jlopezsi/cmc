library(foreign)
ej12_8<-read.spss("EJ12_8.sav", to.data.frame=TRUE)
#reading "EJ12_8.sav" with package memisc gives error
#This package collects an assortment of tools that are intended to make work with R easier for the author of this package and are submitted to the public in the hope that they will be also be useful to others.
#The tools in this package can be grouped into five major categories:
#Data preparation and management, Data analysis
#Presentation of analysis results, Simulation, and Programming
library(memisc)
#ej07<-as.data.set(spss.system.file("EJ07.sav"))
#names(ej07)
names(ej12_8)
#attach(ej12_8)
require(descr)

#xtabs(~Discoteca+c1+c12f_2)

#ftable(xtabs(~Discoteca+c1+c12f_2))
#descr(Discoteca)
#crosstab(Discoteca, c1)
#crosstab(Discoteca, c12f_2, weight=Pes)

oci<-ej12_8[,1018:1049]

names(oci)
#[1] "Discoteca"          "Llegir_llibres"     "esports"           
#[4] "Sortir_nit"         "Viatjar_f_Cat"      "Excursions"        
#[7] "Videoconsoles"      "TV"                 "Actes_pol"         
#[10] "Actes_rel"          "Cinema"             "Teatre"            
#[13] "Danza_op_clas"      "Concert_M_Mod"      "Estudiar"          
#[16] "Expo_museos"        "Amics_carrer"       "Amics_quedar"      
#[19] "Comprar"            "Passejar"           "Diari_paper"       
#[22] "Diari_Internet"     "Llegir_blogs"       "Correo_e"          
#[25] "Xatejar"            "Xarxes_Socials"     "Radio_TV_Internet" 
#[28] "Jugar_Internet"     "Descarregar_films"  "Descarregar_musica"
#[31] "Descarregar_jocs"   "Descarregar_soft"  

oci_en<-oci
head(oci_en)
library(plyr)
oci_en <- rename(oci_en, c("Discoteca" = "gcl"))
oci_en$gcl <- revalue(oci_en$gcl, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, c('Llegir_llibres' = 'rnv'))
oci_en$rnv <- revalue(oci_en$rnv, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, c('esports' = 'spt'))
oci_en$spt <- revalue(oci_en$spt, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, c('Sortir_nit' = 'nlf'))
oci_en$nlf <- revalue(oci_en$nlf, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, c('Viatjar_f_Cat' = 'toc'))
oci_en$toc <- revalue(oci_en$toc, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, c('Excursions' = 'hkt'))
oci_en$hkt <- revalue(oci_en$hkt, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, c('Videoconsoles' = 'pvg'))
oci_en$pvg <- revalue(oci_en$pvg, c(N = "N", S = "Y"))

#TV=
oci_en <- rename(oci_en, replace=c('TV' = 'tv'))
oci_en$tv <- revalue(oci_en$tv, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Actes_pol' = 'ape'))
oci_en$ape <- revalue(oci_en$ape, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Actes_rel' = 'ars'))
oci_en$ars <- revalue(oci_en$ars, c(N = 'N', S = 'Y'))

#Cinema=
oci_en <- rename(oci_en, replace=c('Cinema' = 'gmv'))
oci_en$gmv <- revalue(oci_en$gmv, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Teatre' = 'gth'))
oci_en$gth <- revalue(oci_en$gth, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Danza_op_clas' = 'gdoc'))
oci_en$gdoc <- revalue(oci_en$gdoc, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Concert_M_Mod' = 'gcm'))
oci_en$gcm <- revalue(oci_en$gcm, c(N = 'N', S = 'Y'))


oci_en <- rename(oci_en, replace=c('Estudiar' = 'std'))
oci_en$std <- revalue(oci_en$std, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Expo_museos' = 'gmu'))
oci_en$gmu <- revalue(oci_en$gmu, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Amics_carrer' = 'wfs'))
oci_en$wfs <- revalue(oci_en$wfs, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Amics_quedar' = 'swf'))
oci_en$swf <- revalue(oci_en$swf, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Comprar' = 'shp'))
oci_en$shp <- revalue(oci_en$shp, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Passejar' = 'wal'))
oci_en$wal <- revalue(oci_en$wal, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Diari_paper' = 'tnp'))
oci_en$tnp <- revalue(oci_en$tnp, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Diari_Internet' = 'dnp'))
oci_en$dnp <- revalue(oci_en$dnp, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Llegir_blogs' = 'rbl'))
oci_en$rbl <- revalue(oci_en$rbl, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Correo_e' = 'email'))
oci_en$email <- revalue(oci_en$email, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Xatejar' = 'chat'))
oci_en$chat <- revalue(oci_en$chat, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c('Xarxes_Socials' = 'snw'))
oci_en$snw <- revalue(oci_en$snw, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c('Radio_TV_Internet' = 'wim'))
oci_en$wim <- revalue(oci_en$wim, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c('Jugar_Internet' = 'pog'))
oci_en$pog <- revalue(oci_en$pog, c(N = 'N', S = 'Y'))

oci_en <- rename(oci_en, replace=c("Descarregar_films" = "dmv"))
oci_en$dmv <- revalue(oci_en$dmv, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Descarregar_musica" = "dms"))
oci_en$dms <- revalue(oci_en$dms, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Descarregar_jocs" = "dvg"))
oci_en$dvg <- revalue(oci_en$dvg, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Descarregar_soft" = "dsw"))
oci_en$dsw <- revalue(oci_en$dsw, c(N = "N", S = "Y"))
#names(oci_en)

#Variables descriptivas (la 1050 no es necesaria, es la variable educación con muchos niveles)
oci.ilu<-ej12_8[,c(10,888,889,891,892,903,904,909, 992, 1051)]

oci.ilu1_en <- oci.ilu
names(oci.ilu1_en)

summary(oci.ilu1_en$v0)
class(oci.ilu1_en)
#head(oci.ilu1_en)
#library(dplyr)
oci.ilu1_en <- rename(oci.ilu1_en, c('v0' = 'Genre'))
oci.ilu1_en$Genre <- revalue(oci.ilu1_en$Genre, c(Dona ='Female', Home = 'Male'))
summary(oci.ilu1_en$Genre)

summary(oci.ilu1_en$Gmuni)
oci.ilu1_en <- rename(oci.ilu1_en, c('Gmuni' = 'SizeTown'))
oci.ilu1_en$SizeTown <- revalue(oci.ilu1_en$SizeTown, c('Menys de 2.000' = '<2001', 'De 2001 a 10.000' = '2001-10000', 'De 10.001 a 50.000'='10001-50000', 'Més de 50.000'='>50000'))
summary(oci.ilu1_en$SizeTown)


oci.ilu1_en <- rename(oci.ilu1_en, c('Ambit' = 'Region'))
oci.ilu1_en$Region <- revalue(oci.ilu1_en$Region, c('Àmbit Metropolità' = 'Metropolitan', 'Comarques Gironines' = 'Girona', 'Camp de Tarragona'='Tarragona', 'Terres de l Ebre'='Ebre', 'Ponent i Alt Pirineu i Aran' = 'AltPirineu', 'Comarques Centrals'= 'Central', 'Penedès'= 'Penedes'))
summary(oci.ilu1_en$Region)


summary(oci.ilu1_en$c1)
oci.ilu1_en <- rename(oci.ilu1_en, c('c1' = 'Age'))
oci.ilu1_en$Age <- revalue(oci.ilu1_en$Age, c('15 a 19 anys' = '15-19', '20 a 24 anys' = '20-24', '25 a 29 anys'='25-29', '30 a 34 anys'='30-34'))
summary(oci.ilu1_en$Age)

summary(oci.ilu1_en$c2_Esp)
oci.ilu1_en <- rename(oci.ilu1_en, c('c2_Esp' = 'Spain'))
oci.ilu1_en$Spain <- revalue(oci.ilu1_en$Spain, c('Estat espanyol' = 'Yes', 'Fora de estat espanyol' = 'No'))
summary(oci.ilu1_en$Spain)

#This does not work, porblem with quotations
names(oci.ilu1_en)
summary(oci.ilu1_en$c4_7)
oci.ilu1_en <- rename(oci.ilu1_en, c('c4_7' = 'ParentsBirth'))
oci.ilu1_en$ParentsBirth <- revalue(oci.ilu1_en$ParentsBirth, c('Ambdós a Catalunya' = 'CatBoth', 'Un a Catalunya i altre a la resta Espanya' = 'CatSp', 'Un estranger i altre a Catalunya o Espanya' = 'OtherSp', 'Ambdós a la resta Espanya' = 'SpSp', 'Ambdós a estranger' = 'OtherBoth'))
summary(oci.ilu1_en$ParentsBirth)

names(oci.ilu1_en)
summary(oci.ilu1_en$c5_8)
oci.ilu1_en <- rename(oci.ilu1_en, c('c5_8' = 'PEducation'))
oci.ilu1_en$Education <- revalue(oci.ilu1_en$Education, c('Estudis inferiors a obligatoris' = '<LS', 'Estudis obligatoris' = 'LS', 'Estudis secundaris postobligatoris'='HS', 'Estudis universitaris' = 'College'))
summary(oci.ilu1_en$PEducation)

names(oci.ilu1_en)
summary(oci.ilu1_en$c9_6c)
oci.ilu1_en <- rename(oci.ilu1_en, c('c9_6c' = 'Occupation'))
oci.ilu1_en$Occupation <- revalue(oci.ilu1_en$Occupation, c('Directors i gerents' = 'Managers', 'Tècnics i Professionals' = 'Technicians', 'Ocupacions que requereixen mitjana qualificació'='AveQual', 'Ocupacions elementals' = 'LowQual'))
summary(oci.ilu1_en$Occupation)

names(oci.ilu1_en)
summary(oci.ilu1_en$c105)
oci.ilu1_en <- rename(oci.ilu1_en, c('c105' = 'Language'))
oci.ilu1_en$Language <- revalue(oci.ilu1_en$Language, c('Català' = 'Cat', 'Tant català com castellà' = 'CatSp', 'Castellà'='Sp', 'Altres llengües o combinacions' = 'Other'))
summary(oci.ilu1_en$Language)

names(oci.ilu1_en)
summary(oci.ilu1_en$c12f_2)
oci.ilu1_en <- rename(oci.ilu1_en, c('c12f_2' = 'YEducation'))
oci.ilu1_en$ParentsEducation <- revalue(oci.ilu1_en$ParentsEducation, c('Obligatoris o inferiors' = 'LS', 'Secundaris postobligatoris' = 'HS', 'Superiors' = 'College', 'No ho sap' = 'LS', 'No contesta' = 'LS'))
summary(oci.ilu1_en$YEducation)

