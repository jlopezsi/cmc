source("../library.gnr/head.R")

if(prj.nmf.state != "done"){
  # Onetime executives go here

fun.install.require(c("NMF"))

  load("../data.gnr/music.Rdata")

  # Loading genre dataframe
  vec.genre <- seq(93, 153, by=3)
  df.genre <- df.music[vec.genre]
  df.genre <- sapply(df.genre, as.numeric)
  nmf.fit <- nmf(df.genre, rank=3,  'lee')
  coefmap(nmf.fit, tracks=NA)
  basismap(nmf.fit, tracks=NA)
  
  # Saving a sample variable
  save(nmf.var1, file="../data.gnr/nmf.var1.Rdata")
}

# Generate the report here
rmarkdown::render(
                  "xx.05.nmf.Rmd"
                  , output_file= "../report.gnr/05.nmf.pdf"
                  );
fun.beep(8) # Mario winning sound

