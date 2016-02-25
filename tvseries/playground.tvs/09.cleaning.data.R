## Cleaning the data
## Unsolved problem
# how can only choose Korean drama files among the all the series ??
# how can make a loops for the all the series for cleaning??

## Download a relevant package
library(jsonlite)
library(tm)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)
library(tm)
library(syuzhet)
library(coreNLP)

## Importing data from Json file
data.29584c.01.en.json <- fromJSON("../rawdata.tvs/29584c/timed.comments.01.en.json")

## checking the data form
str(data.29584c.01.en.json)
class(data.29584c.01.en.json)

## make a corpus
txt.data.29584c.01.en <- paste(data.29584c.01.en.json$value, collapse=" ")
head(txt.data.29584c.01.en)
source.txt.data.29584c.01.en <- VectorSource(txt.data.29584c.01.en)
## premprocesing data
# 1 making a coopus of data
corpus <- Corpus(source.txt.data.29584c.01.en)
# 2 remove  the emoticons
corpus <- tm_map(corpus, removePunctuation)
# 3 remove the space
#corpus <- tm_map(corpus, stripWhitespace)
# 4. correct errors
corpus <- tm_map(corpus, content_transformer(tolower))
# 5 stopwords English
corpus <- tm_map(corpus, removeWords, stopwords("english"))
# 6. stemming task
#corpus <- tm_map(corpus, stemDocument)

## analysing the sentiment using syuzhet package
dtm <- as.character(corpus)
timed.comments <- get_sentences(dtm)
class(s_v)
str(s_v)
head(s_v)
timed_sent <- get_sentiment(timed.comments, method="bing")

## make a plot for sentiment analysis with Bing & Liu
plot(
timed_sent,
type="h",
main="Time comments sentiment analysis",
xlab = "Time",
ylab= "Emotional Valence"
)

## percentage values
percent_vals <- get_percentage_values(timed_sent)
plot(
percent_vals,
type="l",
main="timed comments Using Percentage-Based Means",
xlab = "Narrative Time",
ylab= "Emotional Valence",
col="red"
)

## transformed values
ft_values <- get_transformed_values(
timed_sent,
low_pass_size = 3,
x_reverse_len = 100,
scale_vals = TRUE,
scale_range = FALSE
)
plot(
ft_values,
type ="h",
main ="Timed comments using Transformed Values",
xlab = "Narrative Time",
ylab = "Emotional Valence",
col = "red"
)

## nrc sentiment analysis
nrc_data <- get_nrc_sentiment(timed_sent)
# find a angry sentiment
angry_items <- which(nrc_data$anger > 0)
s_v[angry_items]
# find a joy sentiment
joy_items <- which(nrc_data$joy > 0)
s_v[joy_items]
# simple to view all of the emotions and their values:
pander::pandoc.table(nrc_data[, 1:8])
# examine only the positive and negative valence
pander::pandoc.table(nrc_data[, 9:10])
# calculate a single value of positive or negative valence for each sentence
valence <- (nrc_data[, 9]*-1) + nrc_data[, 10]
valence
# percentage of each emotion
barplot(
sort(colSums(prop.table(nrc_data[, 1:8]))),
horiz = TRUE,
cex.names = 0.7,
las = 1,
main = "Emotions in Sample text", xlab="Percentage"
)

## make data matrix for frequency
#dtm <- DocumentTermMatrix(corpus)
#findFreqTerms(dtm, 5)
#dtm2 <- as.matrix(dtm)
#frequency <- colSums(dtm2)
#frequency <- sort(frequency, decreasing=TRUE)
#head(frequency)

## words could
#words <- names(frequency)
#wordcloud(words[1:500], frequency[1:500])

