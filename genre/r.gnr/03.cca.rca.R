# Note: Running the cca analyisis takes about an hour on the cmc server.
# DO NOT RUN with `prj.cca.state != done` on your pc.

source("../config.R")
source(prj.head)

fun.install.require(c("corclass","RCA"))

if(prj.cca.state != "done"){
   load(pth.music.rdata)

   vec.genre <- grep("^glisten", colnames(df.music)) 

   df.genre <- df.music[vec.genre]
   df.genre <- sapply(df.genre, as.numeric)

   cca.output <- cca(df.genre)
   rca.output <- RCA(df.genre)

   save(cca.output, file="../data.gnr/cca.output.Rdata")
   save(rca.output, file="../data.gnr/rca.output.Rdata")
}

rmarkdown::render(
                  "xx.03.cca.rca.Rmd"
                  , output_file= "../report.gnr/03.cca.rca.pdf"
                  ); fun.beep(8) # Mario winning sound






