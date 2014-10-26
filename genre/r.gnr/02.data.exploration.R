# Attention: Takes long time to process
# Attention: It plays "beeps" on progress

source("../config.R")

rmarkdown::render(
                  "xx.02.data.exploration.Rmd"
                  , output_file=paste0(prj.report.directory
                                       ,"/"
                                       , "02.data.exploration.pdf"
                                       )
                  ); fun.beep(8) # Mario winning sound


