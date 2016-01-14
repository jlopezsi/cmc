## contains viki api functions

## makes the viki url, also checks "?"
fun.viki.make.url <- function(url, api.id, timestamp){
  if(length(grep("\\?", url))==0){
    url <- paste0(url, "?")
  }
  return(paste0(url, "app=", api.id, "&t=",timestamp))
}

## makes the paging and returns the viki url 
fun.viki.make.url.paging <- function(url, page.number, perpage){
  paging.url <- fun.viki.make.url(url, prj.viki.api.id, timestamp)
  paging <- paste0("page=",page.number,"&per_page=",perpage)
  return(paste0(paging.url,"&",paging))
}

## makes the sig and returns the full viki url
fun.viki.make.url.sig <- function(url, page.number, perpage){
  timestamp <- fun.make.timestamp()
  viki.url <- fun.viki.make.url.paging(url, page.number, perpage)
  sig <- hmac(viki.url, prj.viki.api.secret, algo="sha1")
  viki.url.sig <- paste0(viki.url,"&sig=", sig)
  return(viki.url.sig)
}

## attaches the viki domain to the url
fun.viki.make.domain.url.sig <- function(url, page.number, perpage){
  return(paste0(prj.viki.api.domain, 
                fun.viki.make.url.sig(url, page.number, perpage))
  )
}

## downloads the viki url and saves `.json` and `.url` files
fun.viki.download.url <- function(url, fil.name, page.number, perpage){
  if(!page.number){
    page.number <- 1
  }
  if(!perpage){
     perpage <- 25
  }
  domain.sig.url <- fun.viki.make.domain.url.sig(url, page.number, perpage)
  fun.verbose(domain.sig.url)
  fil.name <- paste0("../", prj.rawdata.directory,"/", fil.name)
  download.file(domain.sig.url, destfile=paste0(fil.name, ".json"))
  write(toJSON(domain.sig.url), file = paste0(fil.name, ".url"))
  fun.verbose(sprintf("VIKI URL downloaded : [ %s ]",url))
}

