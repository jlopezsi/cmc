source("D:/research/cmc/tvseries/library.tvs/head.R")

## GET /v4/videos/(VIDEO_ID)/timed_comments/(LANGUAGE_CODE).json
fun.install.require(c("digest","RJSONIO","plyr"))

## viki video parameters (oh my vinus epi 10)
tmp.video.id <- "1088600v"
tmp.language <- "en"
tmp.series.id <- "28538c"
tmp.episod.number <- "10"
tmp.page.number <- 2

## any url based on API documentation here
str.url <- paste0("/v4/videos/",tmp.video.id
                  ,"/timed_comments/", tmp.language,".json")

fil.name <- paste0("tvs." , tmp.series.id, ".epi", tmp.episod.number,".page", tmp.page.number)

fun.viki.download.url(str.url, fil.name)

finish

## downloads the max pages
fun.download.all.pages.url <- function(url){

  ## determin the max pages
  max.page <-
  print(max.page)
  for (i in 1 : max.page) {
  fun.viki.download.url(url,fil.name, page.number = i, perpage = 25)
  }
  ## merge the result files using merge
  data.1 <-
  data.2 <-
  data.3 <-
  data.4 <-
  timed.comments <- merge( data.1, data.2, by = "timed.comemnt.json", all = TRUE)
  ## merge the result files using if function
  if(length(grep("tmp.video.id", fil.name))==1){
  combined.timed.comments <- merge ()
  }
  ## merge the result files using lapply
  files <- c(data.1, data.2, data.3, data.4)
  list.timmed.comments <- lapply(files, function(f) fromJSON(files = f))
  combinded.timmed.comments <- toJSON(list.timmed.comments)
  write(combinded.timmed.comments, file = paste0("tvs.",tmp.series.id,"timmed.comments","epi.",tmp.episod.number,".json"))

  ##Delete the temp.files
  rm(data.1, data.2, data.3, data.4)
}
