source("../library.tvs/head.R")

fun.install.require(c("digest","RJSONIO"))

for(:
str.url <- "/v4/series.json?per_page=25"
fil.name <- "list.series"

fun.viki.download.url(str.url, fil.name)

exit

#Containers

#List-------------------------------------------------------------------------------------
##GET /v4/containers.json
    str.containers <- "http://api.viki.io/v4/containers.json"

#Types-----------------------------------------------------------------------------------

   ##GET /v4/series.json


    str.containers.series <- "http://api.viki.io/v4/series.json"

    ##GET /v4/artists.json (it wasn't the list of artists)

    str.containers.artists <- "http://api.viki.io/v4/artists.json"

#genre-------------------------------------------------------------------------------------
   ##GET /v4/containers/genres.json
    str.containers.genres <- "http://api.viki.io/v4/containers/genres.json"



## This scrip is linked to Containers(series)

## List of containers
fil.name <- "list.containers"

## GET /v4/containers.json
str.url <- "/v4/containers.json"

## any url based on API documentation here
fil.viki.containers <- paste0("tvs.",fil.name)

fun.viki.download.url(str.url, fil.viki.containers)


## Types
## GET /v4/series.json
#str.url <- "/v4/series.json"


#fil.name <- "type.series"

#fil.viki.series <- Paste0("tvs.",fil.name)

#fun.viki.download.url(str.url, fil.viki.series)



##GET /v4/artists.json (it wasn't the list of artists)
#str.url <- "/v4/artists.json"
#fil.viki.artist <-"tvs.artist"
#fun.viki.download.url(str.url, fil.viki.artist)

## Genres
## GET /v4/containers/genres.json
#str.url <- "/v4/containers/genres.json"

## origin_country
## GET /v4/containers.json?&origin_country=us
#str.url <- "/v4/containers.json"

## subtitle_completion (Not the subtitles )
## language code parameter
#tmp.language <- "es"
## GET /v4/containers.json?&subtitle_completion=es
#str.containers.sub.es <- "http://api.viki.io/v4/containers.json"
