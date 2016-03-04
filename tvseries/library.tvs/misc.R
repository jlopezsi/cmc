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

fun.download.n.save.emoji.unicode.tables <- function(){
  fun.verbose(paste0("Downloading Emoji Unicode Tables from :", prj.emoji.unicode.table.url))
  tables = readHTMLTable(prj.emoji.unicode.table.url)
  emoji.tables <- NULL
  for(cnt in 1:length(tables)){
    emoji.tables <- rbind(emoji.tables, tables[[cnt]])
  }
  save(file="../data.tvs/emoji.tables.saved", emoji.tables)
  fun.verbose(paste0("Downloaded Emoji Unicode Tables successfully"))
}
