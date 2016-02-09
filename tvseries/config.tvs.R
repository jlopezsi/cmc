## General parameters
prj.name <- "tvs"

## States
prj.viki.state.init <- "todo" # c("todo", "done")

## Languages
prj.viki.languages <- c("en")

## Directory parameters
prj.data.directory <- paste0("data",".",prj.name)
prj.rawdata.directory <- paste0("rawdata",".",prj.name)
prj.graph.directory <- paste0("graph",".",prj.name)
prj.graphic.directory <- paste0("graphic",".",prj.name)
prj.library.directory <- paste0("library",".",prj.name)
prj.archive.directory <- paste0("archive",".",prj.name)
prj.report.directory <- paste0("report",".",prj.name)
prj.r.directory <- paste0("r",".",prj.name)
prj.head <- paste0("../", prj.library.directory,"/head.R")

## Debug parameters
skip.session.debug <- F
session.verbose.level <- 3
session.debug.level <- 3

session.beep <- T

## Viki api parameters
prj.viki.api.id <- "100486a"
prj.viki.api.secret <- "412acbf87482c046988a966bfdee882b31055470202b9521a7102cdac32b9b10b8257decd8d0"
prj.viki.api.domain <- "http://api.viki.io"

