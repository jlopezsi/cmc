source("../library.gnr/head.R")

fun.install.require(c("beepr", "xtable"))

load("../data.gnr/music.Rdata")

rmarkdown::render(
                  "xx.07.iccss2015.Rmd"
                  , output_file= "../report.gnr/07.iccss2015.pdf"
                  ); fun.beep(8) # Mario winning sound

