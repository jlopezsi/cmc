fun.install.require(c("digest","RJSONIO"))

## Viki api parameters
prj.viki.api.id <- "100486a"
prj.viki.api.secret <- "412acbf87482c046988a966bfdee882b31055470202b9521a7102cdac32b9b10b8257decd8d0"

#makes the timestamp-----------------------------------------------------------------

fun.make.timestamp <-round(as.numeric(Sys.time()))

timestamp <- fun.make.timestamp

# Making sig for video comments----------------------------------------------------------
## viki video parameters (oh my vinus epi 10)
epi.10.oh.url <- "http://api.viki.io/v4/videos/1088600v.json"

timestamp <- "1451381476"

## viki url
epi.10.oh.viki.url <- paste0(epi.10.oh.url,"?app=",prj.viki.api.id,"&t=", timestamp)

## viki url sig

epi.10.oh.sig <- hmac(prj.viki.api.secret, epi.10.oh.viki.url, algo="sha1")

epi.10.oh.viki.url.sig <- paste0(epi.10.oh.viki.url,"&sig=", epi.10.oh.sig)

# Making sig for list-------------------------------------------------------------------

## viki list parameters 
list.id <- "1l"

str.list.url <- paste0("http://api.viki.io/v4/lists/",list.id,".json")


## viki list complete url
str.list.viki.url <- paste0(str.list.url,"?app=",prj.viki.api.id,"&t=", timestamp)

## viki list url sig

str.list.sig <- hmac(prj.viki.api.secret, str.list.viki.url, algo="sha1")

str.list.viki.url.sig <- paste0(str.list.viki.url,"&sig=", str.list.sig)

# Making sig for containers------------------------------------------------------------
## url 
str.containers.list.url <- "http://api.viki.io/v4/containers.json?ids=(ID1,ID2,IDN)"
str.containers.list.viki.url <- Paste0(str.containers.list.url,"?app=",prj.viki.api.id,"&t=", timestamp)




