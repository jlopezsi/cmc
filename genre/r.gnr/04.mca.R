source("../library.gnr/head.R")

if(prj.mca.state != "tmpdone"){
  # Loading libraries
  fun.install.require(c("ade4"))

  # Loading music data
  load("../data.gnr/music.Rdata")

  # Creating genre dataframe
  vec.genre <- seq(93, 153, by=3)
  df.genre <- df.music[vec.genre]

  mca.output <- dudi.acm(df.genre, scannf=F,  nf=2)

  save(mca.output, file="../data.gnr/mca.output.Rdata")
}

rmarkdown::render(
                  "xx.04.mca.Rmd"
                  , output_file= "../report.gnr/04.mca.pdf"
                  );
fun.beep(1) # beep sound
