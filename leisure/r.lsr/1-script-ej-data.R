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
library(plyr)
oci_en <- rename(oci_en, replace=c("Discoteca" = "Disco"))
oci_en$Disco <- revalue(oci_en$Disco, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Llegir_llibres" = "ReadingBooks"))
oci_en$ReadingBooks <- revalue(oci_en$ReadingBooks, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("esports" = "Sports"))
oci_en$Sports <- revalue(oci_en$Sports, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Sortir_nit" = "NightOut"))
oci_en$NightOut <- revalue(oci_en$NightOut, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Viatjar_f_Cat" = "Travelling"))
oci_en$Travelling <- revalue(oci_en$Travelling, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Excursions" = "MountainTours"))
oci_en$MountainTours <- revalue(oci_en$MountainTours, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Videoconsoles" = "VideoGameConsoles"))
oci_en$VideoGameConsoles <- revalue(oci_en$VideoGameConsoles, c(N = "N", S = "Y"))

#TV=
oci_en$TV <- revalue(oci_en$TV, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Actes_pol" = "PoliticalActs"))
oci_en$PoliticalActs <- revalue(oci_en$PoliticalActs, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Actes_rel" = "ReligiousActs"))
oci_en$ReligiousActs <- revalue(oci_en$ReligiousActs, c(N = "N", S = "Y"))

#Cinema=
oci_en$Cinema <- revalue(oci_en$Cinema, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Teatre" = "Theater"))
oci_en$Theater <- revalue(oci_en$Theater, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Danza_op_clas" = "DanceOperaClassic"))
oci_en$DanceOperaClassic <- revalue(oci_en$DanceOperaClassic, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Concert_M_Mod" = "ModernMusicConcerts"))
oci_en$ModernMusicConcerts <- revalue(oci_en$ModernMusicConcerts, c(N = "N", S = "Y"))


oci_en <- rename(oci_en, replace=c("Estudiar" = "Study"))
oci_en$Study <- revalue(oci_en$Study, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Expo_museos" = "Museums"))
oci_en$Museums <- revalue(oci_en$Museums, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Amics_carrer" = "HangingOut"))
oci_en$HangingOut <- revalue(oci_en$HangingOut, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Amics_quedar" = "MeetFrieds"))
oci_en$MeetFrieds <- revalue(oci_en$MeetFrieds, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Comprar" = "Buying"))
oci_en$Buying <- revalue(oci_en$Buying, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Passejar" = "Walking"))
oci_en$Walking <- revalue(oci_en$Walking, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Diari_paper" = "Newspaper"))
oci_en$Newspaper <- revalue(oci_en$Newspaper, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Diari_Internet" = "NewspaperDigital"))
oci_en$NewspaperDigital <- revalue(oci_en$NewspaperDigital, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Llegir_blogs" = "ReadingBlogs"))
oci_en$ReadingBlogs <- revalue(oci_en$ReadingBlogs, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Correo_e" = "Email"))
oci_en$Email <- revalue(oci_en$Email, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Xatejar" = "Chat"))
oci_en$Chat <- revalue(oci_en$Chat, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Xarxes_Socials" = "SocialNetworks"))
oci_en$SocialNetworks <- revalue(oci_en$SocialNetworks, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Radio_TV_Internet" = "InternetMedia"))
oci_en$InternetMedia <- revalue(oci_en$InternetMedia, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Jugar_Internet" = "InternetGames"))
oci_en$InternetGames <- revalue(oci_en$InternetGames, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Descarregar_films" = "DldFilms"))
oci_en$DldFilms <- revalue(oci_en$DldFilms, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Descarregar_musica" = "DldMusic"))
oci_en$DldMusic <- revalue(oci_en$DldMusic, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Descarregar_jocs" = "DldGames"))
oci_en$DldGames <- revalue(oci_en$DldGames, c(N = "N", S = "Y"))

oci_en <- rename(oci_en, replace=c("Descarregar_soft" = "DldSoft"))
oci_en$DldSoft <- revalue(oci_en$DldSoft, c(N = "N", S = "Y"))
names(oci_en)

#Variables descriptivas (la 1050 no es necesaria, es la variable educación con muchos niveles)
oci.ilu1<-ej12_8[,c(10,888,889,891,892,903,904,909, 992, 1051)]

oci.ilu1_en <- oci.ilu1
names(oci.ilu1)
library(plyr)
library(dplyr)

summary(oci.ilu1_en$v0)
class(oci.ilu1_en)

oci.ilu1_en <- rename(oci.ilu1_en, c('v0' = 'Genre'))
oci.ilu1_en$Genre <- revalue(oci.ilu1_en$Genre, c(Dona = "Female", Home = "Male"))
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
oci.ilu1_en <- rename(oci.ilu1_en, c('c5_8' = 'Education'))
oci.ilu1_en$Education <- revalue(oci.ilu1_en$Education, c('Estudis inferiors a obligatoris' = '<LS', 'Estudis obligatoris' = 'LS', 'Estudis secundaris postobligatoris'='HS', 'Estudis universitaris' = 'College'))
summary(oci.ilu1_en$Education)

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
oci.ilu1_en <- rename(oci.ilu1_en, c('c12f_2' = 'ParentsEducation'))
oci.ilu1_en$ParentsEducation <- revalue(oci.ilu1_en$ParentsEducation, c('Obligatoris o inferiors' = 'LS', 'Secundaris postobligatoris' = 'HS', 'Superiors' = 'College', 'No ho sap' = 'LS', 'No contesta' = 'LS'))
summary(oci.ilu1_en$ParentsEducation)

