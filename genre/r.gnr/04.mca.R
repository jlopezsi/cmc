source("../library.gnr/head.R")

if(prj.mca.state != "done"){
  # Loading libraries
  fun.install.require(c("ade4"))

  # Loading music data
  load("../data.gnr/music.Rdata")
  # Loading vector of rows with zero cluster in cca
  load("../data.gnr/cca.zeros.Rdata")
  # Loading vector of cca membership
  load("../data.gnr/cca.membership.Rdata")

  # Creating genre dataframe
  vec.genre <- seq(93, 153, by=3)
  df.genre <- df.music[vec.genre]
  # Excluding rows with zero cluster
  df.genre <- df.genre[-cca.zeros, ]

  # analyze and save the output of mca 
  mca.output <- dudi.acm(df.genre, scannf=F,  nf=2)
  save(mca.output, file="../data.gnr/mca.output.Rdata")

  mca.cluster.output = list()
  for(cnt.i in 1:length(levels(as.factor(cca.membership)))){
    mca.cluster.output[[cnt.i]] <- dudi.acm(df.genre[cca.membership == cnt.i, ], scannf=F,  nf=2)
  }
  save(mca.cluster.output, file="../data.gnr/mca.cluster.output.Rdata")

}

rmarkdown::render(
                  "xx.04.mca.Rmd"
                  , output_file= "../report.gnr/04.mca.pdf"
                  );
fun.beep(1) # beep sound
