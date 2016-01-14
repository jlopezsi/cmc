source("../library.tvs/head.R")

#To retrieve list of video parts for a specified video(Notworking)------------------------
#GET /v4/videos/(VIDEO ID)/video_parts.json?app=100000a

#get url   

str.video.part.url <- paste0("http://api.viki.io/v4/videos/",video.id ,"/video_parts.json")
str.video.part.viki.url <- paste0(str.video.part.url,"?app=",prj.viki.api.id,"&t=", timestamp)
str.video.part.sig <- hmac(prj.viki.api.secret, str.video.part.viki.url, algo="sha1")
str.video.part.viki.url.sig <- paste0(str.video.part.viki.url,"&sig=", str.video.part.sig)

# returns the url and sig
str.video.part.viki.url.sig

# Download the list 
download.file(str.video.part.viki.url.sig, destfile="D:/research/cmc/tvseries/rawdata.tvs/people.viki", method="auto")

#Save list url 
write(toJSON(str.video.part.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/people.viki.json")    