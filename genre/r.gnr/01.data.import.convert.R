source("../library.gnr/head.R")

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
  vec.names <- names(df.music)
  vec.names <- tolower(vec.names)
  vec.names <- gsub("_", ".", vec.names)
  vec.names <- gsub("c3.1n.", "", vec.names)
  vec.names <- gsub("glisten.", "", vec.names)
  vec.names <- gsub("education", "education.raw", vec.names)
  vec.names <- gsub("age", "age.raw", vec.names)
  vec.names <- gsub("occupation", "occupation.raw", vec.names)

  vec.names[prj.genre.col.ids] <- tolower(prj.genre.labels)
  vec.names[prj.descriptors.col.ids] <- tolower(prj.descriptors.labels)


  names(df.music) <- vec.names
  fun.verbose("Colume names transformed to lowercase and dot seperated")

  ## Saves the rdata file
  save(df.music, file=pth.music.rdata)
  fun.print(sprintf("Rdata saved : [ %s ]", pth.music.rdata))
}
