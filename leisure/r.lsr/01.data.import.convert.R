source("../library/head.R")

if(prj.import.state == "done"){
  fun.verbose("Data has already imported. Exiting.")
}else{
  fun.verbose("Starting data cleaning process")

  fun.install.require(c("foreign"))

  fun.verbose("Opening the spss file")
  df.imported <- read.spss(sprintf("../%s/music13feb2012.sav", prj.data.directory), to.data.frame=T)

  n.df.imported <- nrow(df.imported)
  fun.verbose(sprintf("%s rows imported", n.df.imported))

  vct.names <- names(df.imported)
  vct.names <- tolower(vct.names)
  vct.names <- gsub("_", ".", vct.names)
  names(df.imported) <- vct.names
  fun.verbose("Colume names transformed to lowercase and dot seperated")

  fun.write.csv(df.imported, "music.imported.csv")
}
