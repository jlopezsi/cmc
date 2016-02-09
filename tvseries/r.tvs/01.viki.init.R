source("../library.tvs/head.R")

if(prj.viki.state.init == "done"){
  fun.verbose("Viki initial tasks are already done. Exiting.")
}else{
  fun.verbose("Starting viki init process")

  fun.install.require(c("digest","jsonlite","stringi"))

  fun.verbose("Downloading languages")
  #fun.viki.list.languages()

  fun.verbose("Downloading series")
  #fun.viki.list.series()

  fun.verbose("Downloading videos")
  fun.viki.list.videos()
}

