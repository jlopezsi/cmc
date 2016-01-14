source("D:/research/cmc/tvseries/library.tvs/head.R")

## GET /v4/videos/(VIDEO_ID)/timed_comments/(LANGUAGE_CODE).json
fun.install.require(c("digest","RJSONIO"))

## viki video parameters (oh my vinus epi 10)
tmp.video.id <- "1088600v"
tmp.language <- "en"
tmp.series.id <- "28538c"
tmp.episod.number <- "10"

## any url based on API documentation here
str.url <- paste0("/v4/videos/",tmp.video.id 
                  ,"/timed_comments/", tmp.language,".json")

fil.viki.timedcomments <- paste0("tvs." , tmp.series.id, ".epi.", tmp.episod.number)

fun.viki.download.url(str.url, fil.viki.timedcomments)

