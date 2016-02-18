## Cleaning the data
## ? only choose Korean drama files among the all the series ?

## Download a relevant package
library(jsonlite)
library(tm)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)
library(tm)

## Importing data from Json file
data.29584c.01.en.json <- fromJSON("../rawdata.tvs/29584c/timed.comments.01.en.json")

## checking the data form
str(data.29584c.01.en.json)
class(data.29584c.01.en.json)

## make a corpus
txt.data.29584c.01.en <- paste(data.29584c.01.en.json$value, collapse=" ")
head(txt.data.29584c.01.en)
source.txt.data.29584c.01.en <- VectorSource(txt.data.29584c.01.en)
corpus <- Corpus(source.txt.data.29584c.01.en)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, content_transformer(tolower))
stopwords("english")


## words frequency
dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing=TRUE)
head(frequency)

## words could
words <- names(frequency)
wordcloud(words[1:500], frequency[1:500])

# covert string to vector of words
#corpus1 <- unlist(strsplit(corpus, split = ","))
# find indices of words with non-ASCII characters
#corpus2 <- grep("corpus1", iconv(corpus1, "latin1", "ASCII", sub = "corpus1"))
# subset original vector or words to exclude words with non- ASCII chr
#corpus3 <- corpus1[-corpus2]
# convert vector back to a string
#corpus4 <- paste(corpus3, collapse = ",")
# make a corpus
#txt.corpus <- Corpus(VectorSource(corpus4))
#inspect(txt.corpus)
