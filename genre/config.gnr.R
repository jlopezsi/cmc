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
