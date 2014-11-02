source("../library.gnr/head.R")

fun.install.require(c("Hmisc","rmarkdown","ggplot2","foreign","beepr"
                      , "circlize","xtable","stats", "Cairo"
                      , "rmarkdown", "corclass", "RCA", "NMF", "ade4"))

library(devtools)
install_github('pander', 'rapporter')
install_github('rapport', 'rapporter')
