source("../library.tvs/head.R")
fun.install.require(c("digest","RJSONIO"))

## Viki api parameters
prj.viki.api.id <- "100486a"
prj.viki.api.secret <- "412acbf87482c046988a966bfdee882b31055470202b9521a7102cdac32b9b10b8257decd8d0"

#makes the timestamp
fun.make.timestamp <-round(as.numeric(Sys.time()))
timestamp <- fun.make.timestamp


# Making sig for containers------------------------------------------------------------
## url 
str.containers.list.url <- "http://api.viki.io/v4/containers.json?ids=(ID1,ID2,IDN)"
str.containers.list.viki.url <- Paste0(str.containers.list.url,"?app=",prj.viki.api.id,"&t=", timestamp)




