
source("../config.R")
source(prj.head)

fun.install.require(c("corclass"))

load(pth.music.rdata)

vec.genre <- grep("^glisten", colnames(df.music)) 

df.genre <- df.music[vec.genre]
tmp.genre  <- df.genre[1:100,]

df.cca <- tmp.genre
cca.output <- cca(df.cca)
summary(cca.output)
cca.example.output
plot(cca.example.output)
library(RCA)
RCA(cca.example)
RCA.cca.example.output <- RCA(cca.example)
summary(RCA.cca.example.output)
table(RCA.cca.example.output$member)
RCA.cca.example.output$merge
