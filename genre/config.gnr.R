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
prj.genre.col.ids      <- seq(93, 153, by=3)
prj.genre.shortnames   <- c("chl","swr"
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
prj.genre.labels       <- c("Children", "Songwriter"
                            , "Ballands", "Flamenco"
                            , "NewFlamenco", "Folk" 
                            , "SpanishPopRock", "LatinPopRock"
                            , "InternationalPopRock", "Blues"
                            , "Jazz" , "World"
                            , "Reggae", "Rap"
                            , "Tecno", "Hardrock"
                            , "House", "Classic"
                            , "Lyrical", "Opera"
                            , "Operetta")
prj.genre.descriptions <- c("Children's songs", "Songwriter"
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

# Descriptors: Row numbers, shortnames and labels used for plots
prj.descriptors.col.ids    <- c(169,  171,  174, 167
                                , 185, 181)
prj.descriptors.shortnames <- c("gnd","age","ocp","edu"
                                ,"hbt","fml","cca")
prj.descriptors.labels     <- c("Gender","Age","Occupation","Education"
                               ,"Habitation","Family")

# Short labels for descriptors
prj.genre.level.levels  <- c("n","y")
prj.gender.levels       <- c("f","m")
prj.occupation.levels   <- c("aut","emp","ump","rtr","std","hhl")
prj.ecucation.levels    <- c("sec","grd","pst")
prj.habitation.levels   <- c("cpt",">100","50-100","10-50","<10")
prj.family.levels       <- c("<=2","3-4",">4")

# CCA: Shortname and label used for plots
prj.cca.shortnames  <- "cca"
prj.cca.labels      <- "CCAModuleMembership"

