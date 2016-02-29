## Cleaning the data
## Unsolved problem

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
timed.comments.29584c.01.en <- paste(t.c.29584c.1.e$value, sep = ".", collapse=" ")
head(timed.comments.29584c.01.en)
## preprocessing cleaning data
# 1. delete signs
comments <- gsub("[^[:alnum:][:space:]?!,.]", "", timed.comments.29584c.01.en)
#comments <- gsub("[[:punct:]]", "", comments )
head(comments)
# 2. delete ids
comments <- gsub("xe+","", comments )
head(comments)
# 3. delete number
comments <- gsub("[[:digit:]]","", comments )
head(comments)
# 5. delete non english words
comments <- gsub("[^a
-zA-Z0-9]","", comments)
# 4 delete emoticon with letter
comments <- gsub("XD", ".", comments)
comments <- gsub("xD", ".", comments)
comments <- gsub("TT", ".", comments)
comments <- gsub("lt", "", comments)
comments <- gsub("wtf", "", comments)
comments <- gsub("omg", "", comments)
comments <- gsub("Omg", "", comments)
comments <- gsub("OMG", "", comments)
comments <- gsub("omo", "", comments)
comments <- gsub("Omo", "", comments)
comments <- gsub("OMO", "", comments)
comments <- gsub("gtgt", "", comments)
comments <- gsub("LOL", ".", comments)
comments <- gsub("lOl", ".", comments)
comments <- gsub("LOl", ".", comments)
comments <- gsub("yeah", "", comments)
comments <- gsub("yep", "", comments)
comments <- gsub("LC", "", comments)
comments <- gsub("lC", "", comments)
comments <- gsub("LMAO", "", comments)
head(comments)
# 6. remove duplicate words
comments <- gsub("!+", "!", comments)
# check the structure of the comments
head(comments)
class(comments)
write(comments,file = "comments.txt")

## analysing the sentiment using syuzhet package
## import txt file in R for manual adjustment
 #timed.comments <- read.delim(file.choose(), header = T, stringsAsFactors = F)
 #class(timed.comments)
 #str(timed.comments)
 #head(timed.comments)
 #timed.comments <- as.character(timed.comments)

# 1 get sentences
timed.comments <- get_sentences(comments)
# 2 bing
timed.sent.bing <- get_sentiment(timed.comments, method="bing")
timed.sent.bing
# 3 afinn
timed.sent.afinn <- get_sentiment(timed.comments, method="afinn")
timed.sent.afinn
# 4 nrc
timed.sent.nrc <- get_sentiment(timed.comments, method="nrc")
timed.sent.nrc
## make a plot for sentiment analysis with Bing & Liu
plot(
timed.sent.bing,
type="h",
main="Time comments sentiment analysis",
xlab = "Time",
ylab= "Emotional Valence"
)

## percentage values : it is not working due to lack of volum
percent_vals <- get_percentage_values(timed.sent.bing)
 # make a plot for percentage
plot(
percent_vals,
type="l",
main="timed comments Using Percentage-Based Means",
xlab = "Narrative Time",
ylab= "Emotional Valence",
col="red"
)

## transformed values : it is not working due to lack of volum
 # calcualte value
ft_values <- get_transformed_values(
timed.sent.bing,
low_pass_size = 3,
x_reverse_len = 100,
scale_vals = TRUE,
scale_range = FALSE
)
 # make a plot for value
plot(
ft_values,
type ="h",
main ="Timed comments using Transformed Values",
xlab = "Narrative Time",
ylab = "Emotional Valence",
col = "red"
)

## nrc sentiment analysis
# calulate nrc
nrc_data <- get_nrc_sentiment(timed.comments)
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

