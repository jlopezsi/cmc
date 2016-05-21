## contains viki api functions

## makes the viki url, also checks "?"
fun.viki.make.url <- function(url, api.id, timestamp){
  if(length(grep("\\?", url))==0){
    url <- paste0(url, "?")
  }
  timestamp <- fun.make.timestamp()
  return(paste0(url, "app=", prj.viki.api.id, "&t=", timestamp))
}

## makes the paging and returns the viki url
fun.viki.make.url.paging <- function(url, page.number, perpage){
  paging.url <- fun.viki.make.url(url)
  paging <- paste0("page=",page.number,"&per_page=", perpage)
  return(paste0(paging.url,"&",paging))
}

## makes the sig and returns the full viki url
fun.viki.make.url.sig <- function(url, page.number, perpage){
  viki.url <- fun.viki.make.url.paging(url, page.number, perpage)
  sig <- hmac(viki.url, prj.viki.api.secret, algo="sha1")
  viki.url.sig <- paste0(viki.url, "&sig=", sig)
  return(viki.url.sig)
}

## attaches the viki domain to the url
fun.viki.make.domain.url.sig <- function(url, page.number, perpage){
  return(paste0(prj.viki.api.domain,
                fun.viki.make.url.sig(url, page.number, perpage))
  )
}

## downloads the viki url and saves `.json` and `.url` files
fun.viki.download.url <- function(url, fil.name, page.number=1, perpage=25){
  domain.sig.url <- fun.viki.make.domain.url.sig(url, page.number, perpage=F)
  fun.verbose(domain.sig.url)
  fil.name <- fun.viki.retrieve.fil.address(fil.name)
  tryCatch({
    download.file(domain.sig.url, destfile=paste0(fil.name, ".json"))
    write(domain.sig.url, file = paste0(fil.name, ".url"))
    fun.verbose(sprintf("VIKI URL downloaded : [ %s page #%s ]",url, page.number))
  }, error=function(err) {
    system(paste0("rm -f ", fil.name, ".json"))
    write(domain.sig.url, file = paste0(fil.name, ".url"))
    fun.verbose(sprintf("VIKI URL download ERROR : [ %s page #%s ]",url, page.number))
  })
}

## download all pages of specific url
fun.viki.download.url.full <- function(url, fil.name){
  tmp.page = 0
  tmp.pages <- list()
  repeat{
    tmp.page <- tmp.page + 1
    tmp.fil.name <- paste0(fil.name, ".page.", sprintf("%04d", tmp.page), ".tmp")
    tmp.fil.address <- fun.viki.retrieve.fil.address(tmp.fil.name, fil.extension=".json")
    fun.viki.download.url(url, tmp.fil.name , page.number=tmp.page, perpage=25)

    tmp.json <- fromJSON(txt=tmp.fil.address)
    if(url == "series"){ ## dirty fix to avoid ^C character
      tmp.pages[[tmp.page]] <- subset(tmp.json$response, select = -descriptions)
    }else{
      tmp.pages[[tmp.page]] <- tmp.json$response
    }
    if(!tmp.json$more){
      break
    }
  }

  ## saves the full json file
  if(length(tmp.pages[[1]])<1){
    fun.verbose(sprintf("VIKI URL with no pages : [ %s with no pages ]", url))
    system(paste0("echo '", url, "' >> ~/tvs.skipped.url"))
    return(T)
  }else{
    tmp.full.json <- rbind.pages(tmp.pages)
    tmp.full.fil.name <- fun.viki.retrieve.fil.address(fil.name)
    write(toJSON(tmp.full.json), file = paste0(tmp.full.fil.name, ".full.json"))

    ## removes the tmp files
    tmp.rm.fil.name <- paste0(fil.name, ".page.*.tmp.*")
    tmp.rm.fil.address <- fun.viki.retrieve.fil.address(tmp.rm.fil.name)
    system(paste0("rm -rf ", tmp.rm.fil.address))
    fun.verbose(sprintf("VIKI URL download completed : [ %s with %s pages ]", url, tmp.page))
    return(F)
  }
}

## retrieves the file address for the specified file name
fun.viki.retrieve.fil.address <- function(fil.name, fil.extension=NULL){
  fil.name <- paste0("../", prj.rawdata.directory,"/", fil.name)
  if(!is.null(fil.extension)){
    fil.name <- paste0(fil.name, fil.extension)
  }
  return(fil.name)
}

## lists the languages
fun.viki.list.languages <- function(){
  url <- "/v4/languages.json"
  fil.name <- "languages"
  fun.viki.download.url(url, fil.name)
}

## lists the series
fun.viki.list.series <- function(){
  url <- "/v4/series.json"
  fil.name <- "series"
  fun.viki.download.url.full(url, fil.name)
  fil.address <- fun.viki.retrieve.fil.address(fil.name)
  fil.address.json <- paste0(fil.address, ".full.json")
  series <- fromJSON(txt=fil.address.json)
  fil.address.saved <- paste0(fil.address, ".full.saved")
  save(series, file=fil.address.saved)
}

fun.viki.list.videos <- function(){
  fil.name <- "series"
  fil.address <- fun.viki.retrieve.fil.address(fil.name)
  fil.address.saved <- paste0(fil.address, ".full.saved")
  load(fil.address.saved)
  for(cnt.series in 1:nrow(series)){
    tmp.series <- series[cnt.series,]
    fun.verbose(sprintf("Downloading video list for #%s %s", tmp.series$id, tmp.series$titles$en))
    ## makes the directory for each series
    system(paste0("mkdir -p ", fun.viki.retrieve.fil.address(tmp.series$id)))
    url <- sprintf("/v4/containers/%s/videos.json", tmp.series$id)
    fil.name <- paste0(tmp.series$id, "/videos")
    fun.viki.download.url.full(url, fil.name)
    fil.address <- fun.viki.retrieve.fil.address(fil.name)
    fil.address.json <- paste0(fil.address, ".full.json")
    videos <- fromJSON(txt=fil.address.json)
    fil.address.saved <- paste0(fil.address, ".full.saved")
    save(series, file=fil.address.saved)

    for(cnt.videos in 1:nrow(videos)){
      tmp.videos <- videos[cnt.videos, ]
      for(cnt.languages in prj.viki.languages) {
        fun.verbose(sprintf("Downloading timed comments in %s for #%s of %s"
                            , cnt.languages, tmp.videos$number, tmp.series$id))
        url <- sprintf("/v4/videos/%s/timed_comments/%s.json", tmp.videos$id, cnt.languages)
        fil.name <- sprintf("%s/timed.comments.%02d.%s", tmp.series$id,  tmp.videos$number, cnt.languages)
        fun.viki.download.url(url, fil.name)
        fil.address <- fun.viki.retrieve.fil.address(fil.name)
        fil.address.json <- paste0(fil.address, ".full.json")
        if(file.exists(fil.address.json)){
          timed.comments <- fromJSON(txt=fil.address.json)
          fil.address.saved <- paste0(fil.address, ".full.saved")
          save(timed.comments, file=fil.address.saved)
        }
      }
    }
  }
}

fun.viki.list.episodes <- function(){
  fil.name <- "series"
  fil.address <- fun.viki.retrieve.fil.address(fil.name)
  fil.address.saved <- paste0(fil.address, ".full.saved")
  load(fil.address.saved)
  flg.fast.forward <- T
  for(cnt.series in 1:nrow(series)){
    tmp.series <- series[cnt.series,]
    if(flg.fast.forward == T){
      if(tmp.series$id == "92392v"){
      #if(tmp.series$id == "29584c"){
        flg.fast.forward <- F
      }else{
        print(sprintf("%s skipped.", tmp.series$id))
      }
    }else{
      fun.verbose(sprintf("Downloading episodes list for #%s %s", tmp.series$id, tmp.series$titles$en))
      ## makes the directory for each series
      system(paste0("mkdir -p ", fun.viki.retrieve.fil.address(tmp.series$id)))
      url <- sprintf("/v4/containers/%s/episodes.json", tmp.series$id)
      fil.name <- paste0(tmp.series$id, "/episodes")
      flg.skip <- fun.viki.download.url.full(url, fil.name)
      if(flg.skip == F) {
        fil.address <- fun.viki.retrieve.fil.address(fil.name)
        fil.address.json <- paste0(fil.address, ".full.json")
        episodes <- fromJSON(txt=fil.address.json)
        fil.address.saved <- paste0(fil.address, ".full.saved")
        save(series, file=fil.address.saved)

        for(cnt.episodes in 1:nrow(episodes)){
          tmp.episodes <- episodes[cnt.episodes, ]
          for(cnt.languages in prj.viki.languages) {
            fun.verbose(sprintf("Downloading timed comments in %s for #%s of %s"
                                , cnt.languages, tmp.episodes$number, tmp.series$id))
            url <- sprintf("/v4/episodes/%s/timed_comments/%s.json", tmp.episodes$id, cnt.languages)
            fil.name <- sprintf("%s/episode.timed.comments.%02d.%s", tmp.series$id,  tmp.episodes$number, cnt.languages)
            fun.viki.download.url(url, fil.name)
            fil.address <- fun.viki.retrieve.fil.address(fil.name)
            fil.address.json <- paste0(fil.address, ".full.json")
            if(file.exists(fil.address.json)){
              timed.comments <- fromJSON(txt=fil.address.json)
              fil.address.saved <- paste0(fil.address, ".full.saved")
              save(timed.comments, file=fil.address.saved)
            }
          }
        }
      }
    }
  }
}

