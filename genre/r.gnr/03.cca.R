# Note: Running the cca analyisis takes about an hour on the cmc server.
# DO NOT RUN with `prj.cca.state != done` on your pc.

source("../library.gnr/head.R")

if(prj.cca.state != "done"){
  fun.install.require(c("corclass"))
  load("../data.gnr/music.Rdata")

  vec.genre <- seq(93, 153, by=3)

  df.genre <- df.music[vec.genre]
  df.genre <- sapply(df.genre, as.numeric)

  cca.output <- cca(df.genre)

  save(cca.output, file="../data.gnr/cca.output.Rdata")
}

if(prj.rca.state != "done"){
  load(pth.music.rdata)
  fun.install.require(c("corclass","RCA"))

  rca.output <- RCA(df.genre)
  save(rca.output, file="../data.gnr/rca.output.Rdata")

  vec.rca <- c(0.05, 0.075, 0.1, 0.25, 0.5)
  for(key.p in vec.rca){
    print(key.p)
    rca.output <- RCA(df.genre, 100, p_value=key.p)
    save(rca.output, file=sprintf("../data.gnr/rca.output.%s.Rdata", key.p))
  }
}

rmarkdown::render(
                  "xx.03.cca.Rmd"
                  , output_file= "../report.gnr/03.cca.pdf"
                  );
fun.beep(8) # Mario winning sound
