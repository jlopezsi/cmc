source("../library.tvs/head.R")

fun.install.require(c("digest","RJSONIO"))

for(:
str.url <- "/v4/series.json?per_page=25"
fil.name <- "list.series"

fun.viki.download.url(str.url, fil.name)

exit

#Containers

#List-------------------------------------------------------------------------------------
##GET /v4/containers.json
    str.containers <- "http://api.viki.io/v4/containers.json"
    
#Types-----------------------------------------------------------------------------------
   
   ##GET /v4/series.json
    

    str.containers.series <- "http://api.viki.io/v4/series.json"
    
    ##GET /v4/artists.json (it wasn't the list of artists)
    
    str.containers.artists <- "http://api.viki.io/v4/artists.json"
    
#genre-------------------------------------------------------------------------------------
   ##GET /v4/containers/genres.json 
    str.containers.genres <- "http://api.viki.io/v4/containers/genres.json"
    

#origin_country----------------------------------------------------------------------------
    ##GET /v4/containers.json?&origin_country=us
    
    str.containers.korea <- "http://api.viki.io/v4/containers.json"
    
    

#subtitle_completion (Not the subtitles )--------------------------------------------------
   ##to the language code 
        # GET /v4/containers.json?&subtitle_completion=es
    str.containers.sub.es <- "http://api.viki.io/v4/containers.json"
    
#people (Not..working...)------------------------------------------------------------------
    #List people associated with a container
    #GET /v4/containers/CONTAINER_ID/people.json

#get url   
    container.id <- "28538c"
    str.people.url <- paste0("http://api.viki.io/v4/container/",container.id ,"/people.json")
    
# Download the list 
    download.file(str.people.viki.url.sig, destfile="D:/research/cmc/tvseries/rawdata.tvs/people.viki", method="auto")
    
    #Save list url 
    write(toJSON(str.people.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/people.viki.json")    
