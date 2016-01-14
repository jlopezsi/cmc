source("../library.tvs/head.R")

## GET /v4/lists/list_id.json
fun.install.require(c("digest","RJSONIO"))

## list parameters 
## A list of featured content : List id is 1l
## A list of on air containers : List id is 2l
## A list of upcoming containers : List id is 6l
tmp.list.id <- "1l"

## Make URL with sig and download the file 
str.url <- paste0("/v4/lists/",tmp.list.id ,".json")

fil.viki.list <- paste0("tvs." , tmp.list.id, ".list.")

fun.viki.download.url(str.url, fil.viki.list)

#finding max pages 
str.url <- paste0("/4/list/",tmp.list.id, ".json")

str.url <- "/v4/series.json?page=1&per_page=25"


### To do
## Wanted lists (Not working...)
## wanted lists mean : the lists of videos that need contributions: more subtitles etc
## GET /v4/wanted_lists/contribution_subtitle_en.json
## wanted list parameters 
#tmp.wanted.language <- "en"
#tmp.wanted.contribution <- "contribution_subtitle_"

#str.url <- pasete0("/v4/wanted_lists/",tmp.wanted.contribution,tmp.wanted.language,".json")

#fil.viki.wanted.list <- paste0("tvs." ,tmp.wanted.contribution,".",tmp.wanted.language, "wanted.list.")

#fun.viki.download.url(str.url, fil.viki.wanted.list)