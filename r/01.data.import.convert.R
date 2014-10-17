source("../library/head.R")

if(prj.import.state == "done"){
  fun.verbose("Data has already imported. Exiting.")
}else{
  fun.verbose("Starting data cleaning process")

  fun.install.require(c("foreign"))

  fun.verbose("Opening the spss file")
  df.music <- read.spss(sprintf("../%s/Data/music13feb2012.sav", prj.archive.directory), to.data.frame=T)

  n.df.music <- nrow(df.music)
  fun.verbose(sprintf("%s rows imported", n.df.music))

  ## Trims colnames
  vct.names <- names(df.music)
  vct.names <- tolower(vct.names)
  vct.names <- gsub("_", ".", vct.names)
  vct.names <- gsub("c3.1n.", "", vct.names)
  names(df.music) <- vct.names
  fun.verbose("Colume names transformed to lowercase and dot seperated")

  ## Saves the rdata file
  save(df.music, file=pth.music.rdata)
  fun.print(sprintf("Rdata saved : [ %s ]", pth.music.rdata))
}
