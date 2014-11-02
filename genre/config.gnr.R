prj.name <- "gnr"
prj.import.state <- "done"
prj.cca.state <- "done"
prj.rca.state <- "done"
prj.mca.state <- "done"
prj.nmf.state <- "inprocess"
prj.data.directory <- paste0("data",".",prj.name)
prj.graph.directory <- paste0("graph",".",prj.name)
prj.graphic.directory <- paste0("graphic",".",prj.name)
prj.library.directory <- paste0("library",".",prj.name)
prj.archive.directory <- paste0("archive",".",prj.name)
prj.report.directory <- paste0("report",".",prj.name)
prj.r.directory <- paste0("r",".",prj.name)
prj.head <- paste0("../", prj.library.directory,"/head.R")

pth.music.rdata <- sprintf("../%s/music.Rdata", prj.data.directory)

skip.session.debug <- F
session.verbose.level <- 3
session.debug.level <- 3

session.beep <- T

# Music genres: Row numbers, shortnames and labels used for plots
prj.genres.col.ids      <- seq(93, 153, by=3)
prj.genres.short.names   <- c("chl","swr"
                            ,"bld","flm"
                            ,"nfl","flk"
                            ,"spp" ,"lpp"
                            ,"ipp","bls"
                            ,"jzz" ,"wrl"
                            ,"rgg","rap" 
                            ,"tcn","hrk"
                            ,"hus","cls"
                            ,"lyr","opr"
                            ,"opt")
prj.genres.labels       <- c("Children", "Songwriter"
                            , "Ballad", "Flamenco"
                            , "NewFlamenco", "Folk" 
                            , "SpanishPopRock", "LatinPopRock"
                            , "InternationalPopRock", "Blues"
                            , "Jazz" , "World"
                            , "Reggae", "Rap"
                            , "Tecno", "Hardrock"
                            , "House", "Classic"
                            , "Lyrical", "Opera"
                            , "Operetta")
prj.genres.descriptions <- c("Children's songs", "Songwriter"
                            , "Melodic songs", "Flamenco"
                            , "NewFlamenco", "Other Spanish folk music" 
                            , "SpanishPopRock", "LatinPopRock"
                            , "InternationalPopRock", "Blues"
                            , "Jazz" , "World Music"
                            , "Reggae", "Rap"
                            , "Electronic, tecno", "Hardrock"
                            , "House", "Classic"
                            , "Lyrical music", "Opera"
                            , "Operetta")
prj.genres.col.names  <- tolower(prj.genres.labels)

# Descriptors: Row numbers, short.names and labels used for plots
prj.descriptors.col.ids       <- c(169,  171,  174, 167
                                   , 185, 181)
prj.descriptors.short.names    <- c("gnd","age","ocp","edu"
                                   ,"hbt","fml")
prj.descriptors.labels        <- c("Gender","Age","Occupation","Education"
                                   ,"Habitation","Family")
prj.descriptors.descriptions  <- c("Gender", "Age", "Occupational status" ,"Education"
                                   ,"Habitat" , "Household size (persons >15 years)")
prj.descriptors.col.names  <- tolower(prj.descriptors.labels)

# Short labels for descriptors
prj.genres.short.levels  <- c("n","y")
prj.gender.short.levels       <- c("f","m")
prj.occupation.short.levels   <- c("slf","emp","ump","rtr","std","otr")
prj.ecucation.short.levels    <- c("edu1","edu2","edu3")
prj.habitation.short.levels   <- c("cpt",">100","50-100","10-50","<10")
prj.family.short.levels       <- c("<=2","3-4",">4")

# Long labels for descriptors
prj.genres.long.levels  <- c("No","Yes")
prj.gender.long.levels       <- c("Female","Male")
prj.occupation.long.levels   <- c("Self-employed","Employed","Unemployed","Retired"
                                  ,"Students","Homemaker, with disability (Others)")
prj.education.long.levels    <- c("Upper secondary or below","Graduate","Post graduate")
prj.habitation.long.levels   <- c("Provincial capital",">100K","50K-100K","10K-50K","<10K")
prj.family.long.levels       <- c("2 members or fewer","3-4 members",">4 members")

# CCA: Shortname and label used for plots
prj.cca.short.names  <- "cca"
prj.cca.labels      <- "CCAModuleMembership"

prj.manuscript.title  <- "Suggested table: change `prj.manuscript.title` in `config.R`"
prj.manuscript.authors  <- "Jordi Lopez Sintas, Abahgna Ghahraman"
