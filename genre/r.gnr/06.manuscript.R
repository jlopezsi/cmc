source("../library.gnr/head.R")

fun.install.require(c("beepr", "xtable"))

load("../data.gnr/music.Rdata")

rmarkdown::render(
                  "xx.06.manuscript.Rmd"
                  , output_file= "../report.gnr/06.manuscript.pdf"
                  ); fun.beep(8) # Mario winning sound

