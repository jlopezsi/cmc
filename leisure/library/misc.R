## Install if needed and then include the libraries
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

## Write to csv file
fun.write.csv <- function(mdf,fil){
  fun.print("Function initiated : [ fun.write.csv ]")
  pth.csv.fil <- sprintf("../%s/%s",prj.saved.directory, fil)
  write.csv(mdf, file=pth.csv.fil)
  fun.print(sprintf("CSV saved : [ %s ]",pth.csv.fil))
  fun.print("Function returned : [ fun.write.csv ]")
}

## Read from .saved file if exists, or from .csv and wirte to .saved file.
fun.read.csv <- function(fil,cache=T){
  fun.print("Function initiated : [ fun.read.csv ]")
  pth.saved.fil <- sprintf("../%s/%s.saved", prj.saved.directory,fil)
  pth.csv.fil <- sprintf("../%s/%s", prj.csv.process.directory ,fil)
  if(file.exists(pth.saved.fil) & cache==T){
    load(pth.saved.fil)
    fun.print(sprintf("CSV loaded from saved file : [ %s ]", pth.saved.fil))
    fun.print("Function returned(1) : [ fun.read.csv ]")
    return(csv)
  }else{
    csv <- read.csv(pth.csv.fil)
    fun.print(sprintf("CVS read : [ %s ]", pth.csv.fil))
    save(csv, file=pth.saved.fil)
    fun.print(sprintf("CSV saved to saved file : [ %s ]", pth.saved.fil))
    fun.print("Function returned(2) : [ fun.read.csv ]")
    return(csv)
  }
}

fun.read.data <- function(path.name, file.name, column.types, missing.types) {
  read.csv( url( paste(path.name, file.name, sep="") ), 
            colClasses=column.types,
            na.strings=missing.types )
}

fun.html.to.text <- function(input, ...) {
  ###---PACKAGES ---###
  require(RCurl)
  require(XML)
  
  
  ###--- LOCAL FUNCTIONS ---###
  # Determine how to grab html for a single input element
  evaluate_input <- function(input) {
    # if input is a .html file
    if(file.exists(input)) {
      char.vec <- readLines(input, warn = FALSE)
      return(paste(char.vec, collapse = ""))
    }
    
    # if input is html text
    if(grepl("</html>", input, fixed = TRUE)) return(input)
    
    # if input is a URL, probably should use a regex here instead?
    if(!grepl(" ", input)) {
      # downolad SSL certificate in case of https problem
      if(!file.exists("cacert.perm")) download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.perm")
      return(getURL(input, followlocation = TRUE, cainfo = "cacert.perm"))
    }
    
    # return NULL if none of the conditions above apply
    return(NULL)
  }
  
  # convert HTML to plain text
  convert_html_to_text <- function(html) {
    doc <- htmlParse(html, asText = TRUE)
    text <- xpathSApply(doc, "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]", xmlValue)
    return(text)
  }
  
  # format text vector into one character string
  collapse_text <- function(txt) {
    return(paste(txt, collapse = " "))
  }
  
  ###--- MAIN ---###
  # STEP 1: Evaluate input
  html.list <- lapply(input, evaluate_input)
  
  # STEP 2: Extract text from HTML
  text.list <- lapply(html.list, convert_html_to_text)
  
  # STEP 3: Return text
  text.vector <- sapply(text.list, collapse_text)
  return(text.vector)
}

fun.panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r = (cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex * abs(r))
}
