## Cleaning the data
## Download a relevant package
library(jsonlite)
library(tm)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)

## Importing data from Json file

data.29584c.01.en.json <- fromJSON(file = )

## Prepare the text for analysis
# remove unnecessary space
txt.29584c.01.en <- gsub("[ \t]{2,}","",txt.29584c.01.en)
txt.29584c.01.en <- gsub("^\\s+|\\s+$", "", txt.29584c.01.en)
# remove punct
txt.29584c.01.en <- gsub("[[:punct:]]", "", txt.29584c.01.en)
# remove cntrl
txt.29584c.01.en <- gsub("[[:cntrl:]]", "", txt.29584c.01.en)
# remove
txt.29584c.01.en <- gsub("\\d+", "", txt.29584c.01.en)
# remove number
txt.29584c.01.en <- gsub("[[:digit:]]", "", txt.29584c.01.en)
# remove url
txt.29584c.01.en <- gsub("http\\+", "", txt.29584c.01.en)
# remove user information
txt.29584c.01.en <- gsub("[user:+]", "", txt.29584c.01.en)
 #example of user information : "user":{"id":"7905008u","username":"minsu_lee","name":"MInsu Lee","staff":false,"images":{"avatar":{"url":"https://graph.facebook.com/100001765202612/picture?width=215&height=215"}}}},
 #
txt.29584c.01.en <- gsub("[[:digit:]]", "", txt.29584c.01.en)
## define "tolower error handling" function
try.error = function(x)
{
 # create missing value
 y = NA
 # tryCatch error
 try_error = tryCatch(tolower(x), error=function(e) e)
 #if not an error
 if (!inherits(try_error, "error"))
 y = tolower(x)
 # result
 return(y)
}

## lower case using try.error with sapply
txt.29584c.01.en= sapply(txt.29584c.01.en, try.error)

## remove NAs in some_txt
txt.29584c.01.en= txt.29584c.01.en[!is.na(txt.29584c.01.en)]
names(txt.29584c.01.en) = NULL
