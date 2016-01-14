## contains viki api functions

## makes the viki url, also checks "?"
fun.viki.make.url <- function(url, api.id, timestamp){
  if(length(grep("\\?", url))==0){
    url <- paste0(url, "?")
  }
  return(paste0(url, "app=", api.id, "&t=",timestamp))
}


## makes the sig and returns the full viki url
fun.viki.make.url.sig <- function(url){
  timestamp <- fun.make.timestamp()
  viki.url <- fun.viki.make.url(url, prj.viki.api.id, timestamp)
  sig <- hmac(viki.url, prj.viki.api.secret, algo="sha1")
  viki.url.sig <- paste0(viki.url, "&sig=", sig)
  return(viki.url.sig)
}

## attaches the viki domain to the url
fun.viki.make.domain.url.sig <- function(url){
  return(paste0(prj.viki.api.domain, 
                fun.viki.make.url.sig(url))
  )
}

## downloads the viki url and saves `.json` and `.url` files
fun.viki.download.url <- function(url, fil.name){
  domain.sig.url <- fun.viki.make.domain.url.sig(url)
  fun.verbose(domain.sig.url)
  fil.name <- paste0("../", prj.rawdata.directory,"/", fil.name)
  download.file(domain.sig.url, destfile=paste0(fil.name, ".json"))
  write(toJSON(domain.sig.url), file = paste0(fil.name, ".url"))
  fun.verbose(sprintf("VIKI URL downloaded : [ %s ]",url))
}

## TODO
fun.viki.list.genres <- function(){
}
