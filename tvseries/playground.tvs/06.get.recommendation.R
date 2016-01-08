#Get recomendation------------------------------------------------------------------------
 ##GET /v4/videos/VIDEO_ID/recommendations.json
 ##Oh my vinus epi 10 recommendation 

#get url
video.id <- "1088600v"

str.recommendation.url <- paste0("http://api.viki.io/v4/videos/",video.id,"/recommendations.json")
str.recommendation.viki.url <- paste0(str.recommendation.url,"?app=",prj.viki.api.id,"&t=", timestamp)
str.recommendation.sig <- hmac(prj.viki.api.secret, str.recommendation.viki.url, algo="sha1")
str.recommendation.viki.url.sig <- paste0(str.recommendation.viki.url,"&sig=", str.recommendation.sig)

# returns the url and sig
str.recommendation.viki.url.sig

# Download the list 
download.file(str.recommendation.viki.url.sig, destfile="D:/research/cmc/tvseries/rawdata.tvs/recommendation.viki", method="auto")

#Save list url 
write(toJSON(str.recommendation.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/recommendation.viki.json")

