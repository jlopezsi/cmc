source("../library.gnr/head.R")

if(prj.nmf.state != "done"){
  # Onetime executives go here

  # Load your classes here.
  # I will add them to requirement afterwards
  # fun.install.require(c(""))

  load("../data.gnr/music.Rdata")

  # Loading genre dataframe
  vec.genre <- seq(93, 153, by=3)
  df.genre <- df.music[vec.genre]
  df.genre <- sapply(df.genre, as.numeric)

  # Saving a sample variable
  save(nmf.var1, file="../data.gnr/nmf.var1.Rdata")
}

# Generate the report here
rmarkdown::render(
                  "xx.05.nmf.Rmd"
                  , output_file= "../report.gnr/04.nmf.pdf"
                  );
fun.beep(8) # Mario winning sound
