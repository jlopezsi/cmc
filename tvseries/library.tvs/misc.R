## Installs if needed and then includes the libraries
fun.install.require <- function(libs){
  fun.print("Function initiated : [ fun.install.require ]")
  lapply(libs,
         function(lib){
           if(!require(lib, character.only=T)){
             install.packages(lib, repos="http://cran.es.r-project.org");
             library(lib, character.only=T);
             fun.verbose(sprintf("Library loaded : [ %s ]",lib))
           }
           fun.verbose(sprintf("Library loaded : [ %s ]",lib))
         }
         )
  fun.print("Function ended : [ fun.install.require ]")
}

## makes the timestamp
fun.make.timestamp <- function(){
 return(as.character(round(as.numeric(Sys.time()))))
}

fun.download.n.save.emoji.unicode.table <- function(){
  fun.verbose(paste0("Downloading Emoji Unicode Table from :", prj.emoji.unicode.table.url))
  table = readHTMLTable(prj.emoji.unicode.table.url)
  emoji.table <- NULL
  for(cnt in 1:length(table)){
    emoji.table <- rbind(emoji.table, table[[cnt]])
  }
  save(file="../data.tvs/emoji.table.saved", emoji.table)
  fun.verbose(paste0("Downloaded Emoji Unicode Table successfully"))
}

fun.download.n.save.emoticon.table <- function(){

  emoticon <- c()
  definition <- c()

  for(letter in letters){

    emoticon.url  <- paste0(prj.emoticon.table.base.url
                            , letter)
    fun.verbose(paste0("Downloading Emoticon Table from :"
                       , emoticon.url))

    content = htmlParse(emoticon.url)
    list.of.table.rows = getNodeSet(content
                                     , "//*/table[@class='list']/tr")

    sapply(list.of.table.rows
           , function(r){
             sub.doc = xmlDoc(r)
             sub.doc.def = xpathApply(sub.doc
                                      , "//td[@class='def']/text()"
                                      , xmlValue)

             sub.doc.emoticon = xpathApply(sub.doc
                                           , "//td[@class='smiley']/a/text()"
                                           , xmlValue)
             sub.doc.emoticon = paste0(sub.doc.emoticon
                                       , collapse = '')

             free(sub.doc)

             emoticon <<- c(emoticon, sub.doc.emoticon)
             definition <<- c(definition, sub.doc.def[[1]])
           })

  }

  emoticon.table <- data.frame(cbind(emoticon, definition))

  save(file="../data.tvs/emoticon.table.saved", emoticon.table)
  fun.verbose(paste0("Downloaded Emoticon Table successfully"))
}
