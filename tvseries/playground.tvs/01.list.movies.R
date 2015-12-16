source("../library.tvs/head.R")

fun.install.require(c("digest"))

str.url <- "/v4/movies.json?sort=views"

str.viki.url.sig <- fun.make.viki.url.sig(str.url)
str.viki.domain.url.sig <- fun.make.viki.domain.url.sig(str.url)

fun.verbose(str.viki.url.sig)

fun.verbose(str.viki.domain.url.sig)

