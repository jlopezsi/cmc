## Cleaning the data
## Download a relevant package
library(jsonlite)
library(tm)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)
library(tm)

## Importing data from Json file
data.29584c.01.en.json <- fromJSON("../rawdata.tvs/29584c/timed.comments.01.en.json")

## Prepare the text for analysis
# remove unnecessary space
data.29584c.01.en.json <- gsub("[ \t]{2,}","",data.29584c.01.en.json)
data.29584c.01.en.json <- gsub("^\\s+|\\s+$", "", data.29584c.01.en.json)
# remove punct
data.29584c.01.en.json <- gsub("[[:punct:]]", "", data.29584c.01.en.json)
# remove cntrl
data.29584c.01.en.json <- gsub("[[:cntrl:]]", "", data.29584c.01.en.json)
# remove
data.29584c.01.en.json <- gsub("\\d+", "", data.29584c.01.en.json)
# remove number
data.29584c.01.en.json <- gsub("[[:digit:]]", "", data.29584c.01.en.json)
# remove url
data.29584c.01.en.json <- gsub("http\\+", "", data.29584c.01.en.json)
# remove user information
data.29584c.01.en.json <- gsub("[user:+]", "", data.29584c.01.en.json)
#example of user information : "user":{"id":"7905008u","username":"minsu_lee","name":"MInsu Lee","staff":false,"images":{"avatar":{"url":"https://graph.facebook.com/100001765202612/picture?width=215&height=215"}}}},
#
data.29584c.01.en.json <- gsub("[[:digit:]]", "", data.29584c.01.en.json)
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
data.29584c.01.en.json <- sapply(data.29584c.01.en.json, try.error)

## remove NAs in some_txt
data.29584c.01.en.json = data.29584c.01.en.json [!is.na(data.29584c.01.en.json)]
names(data.29584c.01.en.json) = NULL

corpus <- data.29584c.01.en.json

## words frequency
dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing=TRUE)
head(frequency)

## words could
words <- names(frequency)
wordcloud(words[1:500], frequency[1:500])

