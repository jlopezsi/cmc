#Oh my vinus ep 10 subtitles download
## v4/videos/VIDEO_ID/subtitles/LANGUAGE.srt
   str.sub.es <- "http://api.viki.io/v4/videos/1088600v/subtitles/es.srt"
   
   str.sub.es.viki.url <- paste0(str.sub.es,"?app=",prj.viki.api.id,"&t=",timestamp)
   str.sub.es.sig <- hmac(prj.viki.api.secret, str.sub.es, algo="sha1")
   str.sub.es.viki.url.sig <- paste0(str.sub.es.viki.url,"&sig=",str.sub.es.sig)
   