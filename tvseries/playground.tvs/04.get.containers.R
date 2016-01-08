#Containers

#List-------------------------------------------------------------------------------------
##GET /v4/containers.json
    str.containers <- "http://api.viki.io/v4/containers.json"
    str.containers.viki.url <- paste0(str.containers,"?app=",prj.viki.api.id,"&t=",timestamp)
    str.containers.sig <- hmac(prj.viki.api.secret, str.containers, algo="sha1")
    str.containers.viki.url.sig <- paste0(str.containers.viki.url,"&sig=",str.containers.sig)
    
    download.file(str.containers.viki.url.sig,destfile="D:/research/cmc/tvseries/rawdata.tvs/containers.list.viki", method="auto")
    
    write(toJSON(str.containers.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/containers.list.viki.json")
    
#Types-----------------------------------------------------------------------------------
   
   ##GET /v4/series.json
    
    str.containers.series <- "http://api.viki.io/v4/series.json"
    str.containers.series.viki.url <- paste0(str.containers.series,"?app=",prj.viki.api.id,"&t=",timestamp)
    str.containers.series.sig <- hmac(prj.viki.api.secret, str.containers.series, algo="sha1")
    str.containers.series.viki.url.sig <- paste0(str.containers.series.viki.url,"&sig=",str.containers.series.sig)
    download.file(str.containers.series.viki.url.sig,destfile="D:/research/cmc/tvseries/rawdata.tvs/containers.series.viki", method="auto")
    write(toJSON(str.containers.series.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/containers.series.viki.json")
    
    ##GET /v4/artists.json (it wasn't the list of artists)
    
    str.containers.artists <- "http://api.viki.io/v4/artists.json"
    str.containers.artists.viki.url <- paste0(str.containers.artists,"?app=",prj.viki.api.id,"&t=",timestamp)
    str.containers.artists.sig <- hmac(prj.viki.api.secret, str.containers.artists, algo="sha1")
    str.containers.artists.viki.url.sig <- paste0(str.containers.artists.viki.url,"&sig=",str.containers.artists.sig)
    
    download.file(str.containers.artists.viki.url.sig,destfile="D:/research/cmc/tvseries/rawdata.tvs/containers.artists.viki", method="auto")
    write(toJSON(str.containers.artists.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/containers.artists.viki.json")
    
#genre-------------------------------------------------------------------------------------
   ##GET /v4/containers/genres.json 
    str.containers.genres <- "http://api.viki.io/v4/containers/genres.json"
    
    str.containers.genres.viki.url <- paste0(str.containers.genres,"?app=",prj.viki.api.id,"&t=",timestamp)
    str.containers.genres.sig <- hmac(prj.viki.api.secret, str.containers.genres, algo="sha1")
    str.containers.genres.viki.url.sig <- paste0(str.containers.genres.viki.url,"&sig=",str.containers.genres.sig)
    
    download.file(str.containers.genres.viki.url.sig,destfile="D:/research/cmc/tvseries/rawdata.tvs/containers.genres.viki", method="auto")
    write(toJSON(str.containers.genres.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/containers.genres.viki.json")
    

#origin_country----------------------------------------------------------------------------
    ##GET /v4/containers.json?&origin_country=us
    
    str.containers.korea <- "http://api.viki.io/v4/containers.json"
    
    str.containers.korea.viki.url <- paste0(str.containers.korea,"?app=",prj.viki.api.id,"&t=",timestamp,"&origin_country=kr")
   
     str.containers.korea.sig <- hmac(prj.viki.api.secret, str.containers.korea, algo="sha1")
   
      str.containers.korea.viki.url.sig <- paste0(str.containers.korea.viki.url,"&sig=",str.containers.korea.sig)
    
       download.file(str.containers.korea.viki.url.sig,destfile="D:/research/cmc/tvseries/rawdata.tvs/containers.origin.korea.viki", method="auto")
   
        write(toJSON(str.containers.genres.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/containers.origin.korea.viki.json")
    

#subtitle_completion (Not the subtitles )--------------------------------------------------
   ##to the language code 
        # GET /v4/containers.json?&subtitle_completion=es
    str.containers.sub.es <- "http://api.viki.io/v4/containers.json"
    
    str.containers.sub.es.viki.url <- paste0(str.containers.sub.es,"?app=",prj.viki.api.id,"&t=",timestamp,"&subtitle_completion=es")
        
    str.containers.sub.es.sig <- hmac(prj.viki.api.secret, str.containers.sub.es, algo="sha1")
    str.containers.sub.es.viki.url.sig <- paste0(str.containers.sub.es.viki.url,"&sig=",str.containers.sub.es.sig)
        
    download.file(str.containers.sub.es.viki.url.sig,destfile="D:/research/cmc/tvseries/rawdata.tvs/containers.sub.es.viki", method="auto")
        
    write(toJSON(str.containers.sub.es.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/containers.sub.es.viki.json")
  
    
#people (Not..working...)------------------------------------------------------------------
    #List people associated with a container
    #GET /v4/containers/CONTAINER_ID/people.json

#get url   
    container.id <- "28538c"
    str.people.url <- paste0("http://api.viki.io/v4/container/",container.id ,"/people.json")
    str.people.viki.url <- paste0(str.people.url,"?app=",prj.viki.api.id,"&t=", timestamp)
    str.people.sig <- hmac(prj.viki.api.secret, str.people.viki.url, algo="sha1")
    str.people.viki.url.sig <- paste0(str.people.viki.url,"&sig=", str.people.sig)
    
# returns the url and sig
    str.people.viki.url.sig
    
# Download the list 
    download.file(str.people.viki.url.sig, destfile="D:/research/cmc/tvseries/rawdata.tvs/people.viki", method="auto")
    
    #Save list url 
    write(toJSON(str.people.viki.url.sig), file = "D:/research/cmc/tvseries/rawdata.tvs/people.viki.json")    
