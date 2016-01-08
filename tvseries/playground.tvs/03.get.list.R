#Get list of TV programme


fun.install.require(c("digest","RJSONIO"))

#Built-in Lists : 
  # A list of featured content : List id is 1l
  # A list of on air containers : List id is 2l
  # A list of upcoming containers : List id is 6l

list.id <- "1l"
air.list.id <- "2l"
up.list.id <- "6l"

# Get viki list url and sig ---------------------------------------------------------------
## any url based on API documentation here
str.list.url <- paste0("http://api.viki.io/v4/lists/",list.id ,".json")
str.air.list.url <- paste0("http://api.viki.io/v4/lists/",air.list.id ,".json")
str.up.list.url <- paste0("http://api.viki.io/v4/lists/",up.list.id ,".json")

## viki list url
str.list.viki.url <- paste0(str.list.url,"?app=",prj.viki.api.id,"&t=", timestamp)

## viki list url sig

str.list.sig <- hmac(prj.viki.api.secret, str.list.viki.url, algo="sha1")

str.list.viki.url.sig <- paste0(str.list.viki.url,"&sig=", str.list.sig)

# returns the url and sig
str.list.viki.url.sig

# Download the list 
download.file(str.list.viki.url.sig, destfile="D:/research/cmc/tvseries/rawdata.tvs/list.viki", method="auto")

#Save list url 
write(toJSON(str.list.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/list.viki.json")

#About Wanted lists (Not working...)-------------------------------------------------------

#To retrieve lists of videos that need contributions: more subtitles, more segements…       (thus called "wanted")
#Each of the lists are identified with an alias, for example
#GET /v4/wanted_lists/contribution_subtitle_en.json?app=100000a

str.wanted.lists.url <- "http://api.viki.io/v4/wanted_lists/contribution_subtitle_en.json"
str.wanted.lists.viki.url <- paste0(str.wanted.lists.url,"?app=",prj.viki.api.id,"&t=", timestamp)
str.wanted.lists.sig <- hmac(prj.viki.api.secret, str.wanted.lists.viki.url, algo="sha1")
str.wanted.lists.viki.url.sig <- paste0(str.wanted.lists.viki.url,"&sig=", str.wanted.lists.sig)
# returns the url and sig
str.wanted.lists.viki.url.sig
# Download the list 
download.file(str.wanted.lists.viki.url.sig, destfile="D:/research/cmc/tvseries/rawdata.tvs/wanted.list.viki", method="auto")

#Save list url 
write(toJSON(str.wanted.lists.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/wanted.list.viki.json")
