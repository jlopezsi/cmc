fun.install.require(c("digest"))

## Viki api parameters
prj.viki.api.id <- "100486a"
prj.viki.api.secret <- "412acbf87482c046988a966bfdee882b31055470202b9521a7102cdac32b9b10b8257decd8d0"

## viki video parameters (oh my vinus epi 10)
epi.10.oh.url <- "http://api.viki.io/v4/videos/1088600v.json"

timestamp <- "1451381476"

## viki url
epi.10.oh.viki.url <- paste0(epi.10.oh.url,"?app=",prj.viki.api.id,"&t=", timestamp)

## viki url sig

epi.10.oh.sig <- hmac(prj.viki.api.secret, epi.10.oh.viki.url, algo="sha1")

epi.10.oh.viki.url.sig <- paste0(epi.10.oh.viki.url,"&sig=", epi.10.oh.sig)

## viki video parameters (list)

list.url <- "http://api.viki.io/v4/list.json"

## makes the timestamp

fun.make.timestamp <-as.numeric(Sys.time())

timestamp <- fun.make.timestamp

## viki url
list.viki.url <- paste0(list.url,"?app=",prj.viki.api.id,"&t=", timestamp)

## viki url sig

list.sig <- hmac(prj.viki.api.secret, list.viki.url, algo="sha1")

list.viki.url.sig <- paste0(list.viki.url,"&sig=", list.sig)

