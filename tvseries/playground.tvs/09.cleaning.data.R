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
timed.comments.29584c.01.en <- fromJSON("../rawdata.tvs/29584c/timed.comments.01.en.json")
t.c.29584c.1.e <- timed.comments.29584c.01.en
## checking the data form
str(t.c.29584c.1.e)
class(t.c.29584c.1.e)

## make a corpus ?? PUT "." IN THE END OF EVERYCOMMENTS
timed.comments.29584c.01.en <- paste(t.c.29584c.1.e$value, collapse=" ")
head(timed.comments.29584c.01.en)
## preprocessing cleaning data
# 1. delete signs
comments <- gsub("[[:punct:]]","", timed.comments.29584c.01.en )
# 2. delete ids
comments <- gsub("xe+","", comments )
head(comments)
# 3. delete non english words
comments <- gsub("[^a
-zA-Z0-9]","", comments)
head(comments)
class(comments)


## analysing the sentiment using syuzhet package
# 1 data frame
timed.comments <- get_sentences(comments)
class(timed.comments)
str(timed.comments)
head(timed.comments)
# 2 bing
timed.sent.bing <- get_sentiment(timed.comments, method="bing")
timed.sent.bing
# 3 afinn
timed.sent.afinn <- get_sentiment(timed.comments, method="afinn")
timed.sent.afinn
# 4 nrc
timed.sent.nrc <- get_sentiment(timed.comments, method="nrc")
timed.sent.nrcr
## make a plot for sentiment analysis with Bing & Liu
plot(
timed.sent.bing,
type="h",
main="Time comments sentiment analysis",
xlab = "Time",
ylab= "Emotional Valence"
)

## percentage values
percent_vals <- get_percentage_values(timed.sent.bing)
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
timed.sent.bing,
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
nrc_data <- get_nrc_sentiment(timed.sent.bing)
# find a angry sentiment
angry_items <- which(nrc_data$anger > 0)
timed.comments[angry_items]
# find a joy sentiment
joy_items <- which(nrc_data$joy > 0)
timed.comments[joy_items]
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

