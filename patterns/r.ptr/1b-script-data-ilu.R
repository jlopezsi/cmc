#Variables descriptivas (la 1050 no es necesaria, es la variable educación con muchos niveles)
oci.ilu<-ej12_8[,c(10,888,889,891,892,903,904,909, 992, 1051)]
library(plyr)
#oci.ilu1_en <- oci.ilu
#names(oci.ilu)

summary(oci.ilu$v0)
class(oci.ilu1_en)
#head(oci.ilu1_en)

oci.ilu <- rename(oci.ilu, c('v0' = 'Genre'))
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


