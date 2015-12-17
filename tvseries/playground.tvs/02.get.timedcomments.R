source("../library.tvs/head.R")

fun.install.require(c("digest"))

tmp.video.id <- "1090934v"
tmp.language <- "en"
## any url based on API documentation here
str.url <- paste0("/v4/videos/", tmp.video.id ,"/timed_comments/", tmp.language,".json?")
str.url <- "/v4/videos.json?"

# returns the url and sig
str.viki.url.sig <- fun.viki.make.url.sig(str.url)
fun.verbose(str.viki.url.sig)

# returns the domain, url and sig
str.viki.domain.url.sig <- fun.viki.make.domain.url.sig(str.url)
fun.verbose(str.viki.domain.url.sig)

