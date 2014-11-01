source("../library.gnr/head.R")

if(prj.mca.state != "tempdone"){
  # Loads libraries
  fun.install.require(c("ca", "ade4"))

  # Loads music data
  load("../data.gnr/music.Rdata")
  # Loads vector of rows with zero module in cca
  load("../data.gnr/cca.zeros.Rdata")
  # Loads vector of cca membership
  load("../data.gnr/cca.membership.Rdata")

  # Creates genre dataframe
  df.genre <- df.music[, prj.genre.col.ids]
  # Excludes rows with zero module
  df.genre <- df.genre[-cca.zeros, ]

  # Selects discriptors for mca analysis
  df.descriptors  <- df.music[, prj.descriptors.col.ids]

  # Omits cca module zero
  df.descriptors  <- df.descriptors[-cca.zeros, ]

  # analyze and save the output of mca 
  df.mjca <- data.frame(df.genre, df.descriptors, data.frame(factor(cca.membership)))

  # Renames names for more readabilities
  names(df.mjca) <- c(prj.genre.shortname, prj.descriptors.shortnames, prj.cca.shortnames)

  # Shortens levels for more readabilities
  # `prj.` varibales are stored in `config.R`
  for(cnt.y in 1:21){
    levels(df.mjca[,cnt.y]) <- prj.genre.level
  }
  levels(df.mjca$gnd) <- prj.gender.level
  levels(df.mjca$ocp) <- prj.occupation.level
  levels(df.mjca$edu) <- prj.education.level
  levels(df.mjca$hbt) <- prj.habitation.level
  levels(df.mjca$fml) <- prj.family.level

  # Conducts mca analysis 
  mca.output <- mjca(df.mjca, supcol = 22:28)
  # Saves mca results
  save(mca.output, file="../data.gnr/mca.output.Rdata")

  # A list containing all mca subset results
  mca.module.output = list()

  # for each cca module
  for(cnt.i in 1:length(levels(as.factor(cca.membership)))){
    # Subsets based on cca modules
    tmp.df.mjca <- subset(df.mjca, cca.membership==cnt.i)

    # Conducts mca analysis for current cca modules
    mca.module.output[[cnt.i]] <- mjca(tmp.df.mjca, supcol = 22:28)
  }
  # Saves the list of cca subset results for each module
  save(mca.module.output, file="../data.gnr/mca.module.output.Rdata")
  
  # Repeats the same analysis by the `ade4` package

  # Conducts mca.ade4 analysis
  mca.ade4.output <- dudi.acm(df.genre, scannf=F,  nf=2)
  # Saves mca.ade4 analysis
  save(mca.ade4.output, file="../data.gnr/mca.ade4.output.Rdata")

  # A list containing all mca.ade4 subset results
  mca.ade4.module.output = list()

  # for each cca module
  for(cnt.i in 1:length(levels(as.factor(cca.membership)))){
    # Conducts mca.ade4 for current cca mudlue
    mca.ade4.module.output[[cnt.i]] <- dudi.acm(df.genre[cca.membership == cnt.i, ], scannf=F,  nf=2)
  }

  # Saves the list of cca.ade4 subset results for each module
  save(mca.ade4.module.output, file="../data.gnr/mca.ade4.module.output.Rdata")
}

# Renders the report
rmarkdown::render(
                  "xx.04.mca.Rmd"
                  , output_file= "../report.gnr/04.mca.pdf"
                  );
# Plays beep sound
fun.beep(1) 
