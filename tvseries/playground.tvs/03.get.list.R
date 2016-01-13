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


#About Wanted lists (Not working...)-------------------------------------------------------

#To retrieve lists of videos that need contributions: more subtitles, more segements…       (thus called "wanted")
#Each of the lists are identified with an alias, for example
#GET /v4/wanted_lists/contribution_subtitle_en.json?app=100000a

str.wanted.lists.url <- "http://api.viki.io/v4/wanted_lists/contribution_subtitle_en.json"
