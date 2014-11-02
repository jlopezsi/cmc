# Attention: Takes long time to process
# Attention: It plays "beeps" on progress

source("../library.gnr/head.R")

# Creates the `plots` dir required for `rapport`
cwd <- getwd()
system(sprintf("mkdir %s/../r.gnr/plots", cwd))

rmarkdown::render(
                  "xx.02.data.exploration.Rmd"
                  , output_file= "../report.gnr/02.data.exploration.pdf"
                  ); fun.beep(8) # Mario winning sound


# Dirty fix for changing plots folder of rapport
system(sprintf("mv %s/../r.gnr/plots/*.png %s/../plot.gnr/", cwd, cwd))
system(sprintf("rm -rf %s/../r.gnr/plots", cwd))
