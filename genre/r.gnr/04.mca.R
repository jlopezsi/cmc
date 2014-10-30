source("../library.gnr/head.R")

if(prj.mca.state != "done"){
  # Loads libraries
  fun.install.require(c("ca", "ade4"))

  # Loads music data
  load("../data.gnr/music.Rdata")
  # Loads vector of rows with zero module in cca
  load("../data.gnr/cca.zeros.Rdata")
  # Loads vector of cca membership
  load("../data.gnr/cca.membership.Rdata")

  # Creates genre dataframe
  vec.genre <- seq(93, 153, by=3)
  df.genre <- df.music[vec.genre]
  # Excludes rows with zero module
  df.genre <- df.genre[-cca.zeros, ]

  # Selects discriptors for mca analysis
  df.descriptors  <- df.music[, c(169, 171, 174, 167, 185, 181)]

  # Omits cca module zero
  df.descriptors  <- df.descriptors[-cca.zeros, ]

  # analyze and save the output of mca 
  df.mjca <- data.frame(df.genre, df.descriptors, data.frame(factor(cca.membership)))

  # Renames names for more readabilities
  names(df.mjca) <- c("chl","swr","bld","flm","nfl","flk","spp","lpp","fpp","bls","jzz","wrl","rgg","rap","tcn","hrk","hus","cls","lyr","opr","opt","gnd","age","ocp","edu","hbt","fml","cca")

  # Shortens levels for more readabilities
  for(cnt.y in 1:21){
    levels(df.mjca[,cnt.y]) <- c("n","y")
  }
  levels(df.mjca$gnd) <- c("f","m")
  levels(df.mjca$ocp) <- c("aut","emp","ump","rtr","std","hhl")
  levels(df.mjca$edu) <- c("sec","grd","pst")
  levels(df.mjca$hbt) <- c("cpt",">100","50-100","10-50","<10")
  levels(df.mjca$fml) <- c("<=2","3-4",">4")

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
