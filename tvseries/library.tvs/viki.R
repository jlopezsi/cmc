## contains viki api functions

## makes the viki url
fun.viki.make.url <- function(url, api.id, timestamp){
  return(paste0(url, "&app=", api.id, "&t=",timestamp))
}

## makes the sig and returns the full viki url
fun.viki.make.url.sig <- function(url){
  timestamp <- fun.make.timestamp()
  viki.url <- fun.make.viki.url(url, prj.viki.api.id, timestamp)
  sig <- hmac(viki.url, prj.viki.api.secret, algo="sha1")
  viki.url.sig <- paste0(viki.url, "&sig=", sig)
  return(viki.url.sig)
}

fun.viki.make.domain.url.sig <- function(url){
  return(paste0(prj.viki.api.domain, 
                fun.make.viki.url.sig(url))
  )
}
