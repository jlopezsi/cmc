## Get list of TV programme

# GET /v4/lists/(ID).json

fun.install.require(c("digest","RJSONIO"))


## any url based on API documentation here
str.list.url <- paste0("http://api.viki.io/v4/list/",tmp.video.id ,".json")


# returns the url and sig
str.list.viki.url.sig <- paste0(str.list.url, "?app=",prj.viki.api.id,"&t=", timestamp, "&sig=", epi.10.oh.sig) 
