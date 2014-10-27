# Note: Running the cca analyisis takes about an hour on the cmc server.
# DO NOT RUN with `prj.cca.state != done` on your pc.

source("../config.R")
source(prj.head)

if(prj.cca.state != "done"){
  fun.install.require(c("corclass"))
  load(pth.music.rdata)

  vec.genre <- seq(93, 153, by=3)
  vec.genre.filtered  <- vec.genre[vec.genre != 99]

  df.genre <- df.music[vec.genre]
  df.genre <- sapply(df.genre, as.numeric)

  df.genre.filtered <- df.music[vec.genre.filtered]
  df.genre.filtered <- sapply(df.genre.filtered, as.numeric)

  cca.output <- cca(df.genre)
  cca.output.filtered <- cca(df.genre.filtered)

  save(cca.output, file="../data.gnr/cca.output.Rdata")
  save(cca.output.filtered, file="../data.gnr/cca.output.filtered.Rdata")
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

cca.batch <- "cca"
rmarkdown::render(
                  "xx.03.cca.rca.Rmd"
                  , output_file= "../report.gnr/03.cca.rca.pdf"
                  );
fun.beep(8) # Mario winning sound

cca.batch <- "cca.filtered"
rmarkdown::render(
                  "xx.03.cca.rca.Rmd"
                  , output_file= "../report.gnr/03.cca.filtered.rca.pdf"
                  );
fun.beep(8) # Mario winning sound





