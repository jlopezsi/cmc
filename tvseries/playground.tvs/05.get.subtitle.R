source("../library.tvs/head.R")

##GET /v4/videos/VIDEO_ID/subtitles/LANGUAGE.srt

fun.install.require(c("digest","RJSONIO"))

str.url <- "/v4/videos/1088600v/subtitles/es.srt"

fil.viki.subtitles <- "testsubtitles"

fun.viki.download.url(str.url, fil.viki.subtitles)

