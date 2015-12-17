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

