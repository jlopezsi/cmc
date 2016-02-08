source("../library.tvs/head.R")

## GET /v4/lists/list_id.json
fun.install.require(c("digest","RJSONIO","plyr"))

## list parameters
## A list of featured content : List id is 1l
## A list of on air containers : List id is 2l
## A list of upcoming containers : List id is 6l
tmp.list.id <- "1l"
tmp.page.number <- "1"

## Make URL with sig and download the file-------------------------------------------
#str.url <- paste0("/v4/lists/",tmp.list.id ,".json")

#fil.viki.list <- paste0("tvs." , tmp.list.id, ".list")

#fun.viki.download.url(str.url, fil.viki.list)

#finding max pages--------------------------------------------------------------------

str.url <- paste0("/v4/lists/", tmp.list.id , ".json")

fil.viki.list <- paste0("tvs.", tmp.page.number, ".list")

fun.viki.download.url(url=str.url, fil.name=fil.viki.list, page.number=tmp.page.number)

