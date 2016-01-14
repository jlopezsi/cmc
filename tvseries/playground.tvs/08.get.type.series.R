source("../library.tvs/head.R")

fun.install.require(c("digest","RJSONIO"))
## Types
## GET /v4/series.json
str.url <- "/v4/series.json"

fil.name <- "type.series"

fil.viki.series <- Paste0("tvs.",fil.name)

fun.viki.download.url(str.url, fil.viki.series)