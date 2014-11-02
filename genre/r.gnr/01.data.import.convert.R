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
  vec.names <- gsub(".liric", ".lyrical", vec.names)
  vec.names <- gsub(".fpoprock", ".intpoprock", vec.names)

  # Sets readable column names for genres and descrtiptors
  vec.names[prj.genres.col.ids] <- prj.genres.col.names
  vec.names[prj.descriptors.col.ids] <- prj.descriptors.col.names

  # Sets new col names and verboses
  names(df.music) <- vec.names
  fun.verbose("Colume names transformed to lowercase and dot seperated")

  for(cnt.y in prj.genres.col.ids){
    levels(df.music[,cnt.y]) <- prj.genres.long.levels
  }
  # Setting readable levels for variables
  levels(df.music$gender) <- prj.gender.long.levels
  levels(df.music$occupation) <- prj.occupation.long.levels
  levels(df.music$education) <- prj.education.long.levels
  levels(df.music$habitation) <- prj.habitation.long.levels
  levels(df.music$family) <- prj.family.long.levels

  ## Saves the rdata file
  save(df.music, file=pth.music.rdata)
  fun.print(sprintf("Rdata saved : [ %s ]", pth.music.rdata))
}
