source("../library.tvs/head.R")

fun.install.require(c("digest"))

## any url based on API documentation here
str.url <- "/v4/movies.json?sort=views"

# returns the url and sig
str.viki.url.sig <- fun.viki.make.url.sig(str.url)
fun.verbose(str.viki.url.sig)

# returns the domain, url and sig
str.viki.domain.url.sig <- fun.viki.make.domain.url.sig(str.url)
fun.verbose(str.viki.domain.url.sig)

