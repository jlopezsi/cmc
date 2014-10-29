source("../library.gnr/head.R")

if(prj.mca.state != "tmpdone"){
  # Loading libraries
  fun.install.require(c("ca"))

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

  df.descriptors  <- df.music[, c(169, 171, 174, 167, 185, 181)]
  df.descriptors  <- df.descriptors[-cca.zeros, ]

  # analyze and save the output of mca 
  df.mjca <- data.frame(df.genre, df.descriptors, data.frame(cca.membership))
  mca.output <- mjca(df.mjca, supcol = 22:28)
  save(mca.output, file="../data.gnr/mca.output.Rdata")

  mca.cluster.output = list()
  for(cnt.i in 1:length(levels(as.factor(cca.membership)))){
    tmp.df.mjca <- subset(df.mjca, cca.membership==cnt.i)
    mca.cluster.output[[cnt.i]] <- mjca(tmp.df.mjca, supcol = 22:28)
  }
  save(mca.cluster.output, file="../data.gnr/mca.cluster.output.Rdata")

}

rmarkdown::render(
                  "xx.04.mca.Rmd"
                  , output_file= "../report.gnr/04.mca.pdf"
                  );
fun.beep(1) # beep sound
