source("../library.tvs/head.R")

# Show Timed Comments
##GET /v4/videos/(VIDEO_ID)/timed_comments/(LANGUAGE_CODE).json


fun.install.require(c("digest","RJSONIO"))

## viki video parameters (oh my vinus epi 10)

tmp.video.id <- "1088600v"
tmp.language <- "en"

## any url based on API documentation here
str.url <- paste0("http://api.viki.io/v4/videos/",tmp.video.id ,"/timed_comments/", tmp.language,".json")


# returns the url and sig
str.epi.10.oh.comment.viki.url.sig <- paste0(str.url, "?app=",prj.viki.api.id,"&t=", timestamp, "&sig=", epi.10.oh.sig) 

#download timed comments

download.file(str.epi.10.oh.comment.viki.url.sig, destfile="D:/research/cmc/tvseries/rawdata.tvs/epi.10.oh.timedcomments", method="auto")

#Save epi 10 oh my vinus timed comments url 
write(toJSON(str.epi.10.oh.comment.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/epi.10.oh.timedcomments.json")
