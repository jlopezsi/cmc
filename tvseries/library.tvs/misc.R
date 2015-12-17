## Install if needed and then include the libraries
fun.install.require <- function(libs){
  fun.print("Function initiated : [ fun.install.require ]")
  lapply(libs,
         function(lib){
           if(!require(lib, character.only=T)){
             install.packages(lib, repos="http://cran.es.r-project.org");
             library(lib, character.only=T);
             fun.verbose(sprintf("Library loaded : [ %s ]",lib))
           }
           fun.verbose(sprintf("Library loaded : [ %s ]",lib))
         }
         )
  fun.print("Function ended : [ fun.install.require ]")
}

## makes the timestamp
fun.make.timestamp <- function(digits=10){
 return(as.character(round(as.numeric(Sys.time()))))
}

## makes the viki url
fun.make.viki.url <- function(url, api.id, timestamp){
  return(paste0(url, "&app=", api.id, "&t=",timestamp))
}

## makes the sig and returns the full viki url
fun.make.viki.url.sig <- function(url){
  timestamp <- fun.make.timestamp()
  viki.url <- fun.make.viki.url(url, prj.viki.api.id, timestamp)
  sig <- hmac(viki.url, prj.viki.api.secret, algo="sha1")
  viki.url.sig <- paste0(viki.url, "&sig=", sig)
  return(viki.url.sig)
}

fun.make.viki.domain.url.sig <- function(url){
  return(paste0(prj.viki.api.domain, 
                fun.make.viki.url.sig(url))
  )
}
