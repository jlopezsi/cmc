###########################################
## File name: Debug.R
## 
## Change log:
## 
## ToDos:
##
###########################################

###########################################
## Functions
fun.print <- function(string, level=5){
  if(session.verbose.level <= level){
    print(string)
  }
}

fun.verbose <- function(msg,debug.level=3, verbose.level=3){
  if(skip.session.debug == T){
    return(NULL)
  }
  if(verbose.level >= session.verbose.level){
    print(msg)
  }
  if(debug.level >= session.debug.level){
    session.log <<- rbind(session.log,as.vector(msg))
  }
}

fun.clear.session.log <- function(){
  print("Session log cleared")
  session.log <- ""
}
