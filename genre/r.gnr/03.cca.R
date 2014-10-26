# Note: Running the cca analyisis takes about an hour on the cmc server.
# DO NOT RUN with `prj.cca.state != done` on your pc.

source("../config.R")
source(prj.head)

fun.install.require(c("corclass"))

if(prj.cca.state != "done"){
   load(pth.music.rdata)

   vec.genre <- grep("^glisten", colnames(df.music)) 

   df.genre <- df.music[vec.genre]
   df.genre <- sapply(df.genre, as.numeric)

   cca.output <- cca(df.genre)

   save(cca.output, file="../data.gnr/cca.output.Rdata")
}

rmarkdown::render(
                  "xx.03.cca.Rmd"
                  , output_file= "../report.gnr/03.cca.pdf"
                  ); fun.beep(8) # Mario winning sound


load("../data.gnr/cca.output.Rdata")

fun.install.require(c("RCA"))

rca.output <- RCA(df.genre)
summary(rca.output)
table(rca.output)

#RCA.cca.example.output$merge

