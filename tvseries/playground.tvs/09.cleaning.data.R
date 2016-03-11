## cleans the data
## downloads a relevant package
source("../library.tvs/head.R")

fun.install.require(c(
                      "RCurl"
                      ,"urltools"
                      , "stringi"
                      , "XML"
                      ,"reshape"
                      ,"jsonlite"
                      ,"ggplot2"
                      ,"RColorBrewer"
                      ,"syuzhet"
                      ,"coreNLP"
                      ))

language = "en"
series.id <- "29584c"
episode.number <- "01"

## imports data from Json file
timed.comments <- fromJSON(paste0("../rawdata.tvs/"
                                  ,series.id
                                  ,"/timed.comments."
                                  ,episode.number
                                  ,"."
                                  ,language
                                  ,".json"))

## checks the data form
#str(timed.comments)
#class(timed.comments)
# TODO find and extract characters like ❤️
# 8D 8==D
# XD xDDD
# :D :)))))
# :)   :)))))))))) :))))))))))))))))))))))))))))))
# noooooooo
# yeeesssss yesssssss
# geeehhhhhzzz
# T.T
# ?!?!
# hahaha vs "ha ha ha"
# OMG , lol , ugh, omo

load("../data.tvs/emoji.table.saved")
load("../data.tvs/emoticon.table.saved")
# extracts and keeps the icons
# extracts and keeps the emoticons
# deletes non english sentences

timed.comments$processed <- timed.comments$value
timed.comments$processed <- url_decode(timed.comments$processed)
timed.comments$processed <- gsub("&amp;","&",timed.comments$processed)
timed.comments$processed <- gsub("&lt;","<",timed.comments$processed)
timed.comments$processed <- gsub("&gt;",">",timed.comments$processed)
timed.comments$processed <- gsub("&nbsp;"," ",timed.comments$processed)
timed.comments$processed <- gsub("&iexcl;","¡",timed.comments$processed)

emoji.count <- list()

for(emoji in 1:nrow(emoji.table)){
  emoji.count[[emoji]] <- stri_count_regex(
                                           timed.comments$processed
                                           , as.character(emoji.table[emoji, ]$Native)
                                           )

  timed.comments$processed <- gsub(
                                   as.character(emoji.table[emoji, ]$Native)
                                   , ""
                                   , timed.comments$processed
                                   , perl=TRUE
                                   )
}

emoticon.count <- list()

for(emoticon in 1:nrow(emoticon.table)){
  emoticon.count[[emoticon]] <- stri_count_regex(
                                           timed.comments$processed
                                           , as.character(emoticon.table[emoticon, "emoticon"])
                                           )

  timed.comments$processed <- gsub(
                                   as.character(emoticon.table[emoticon, "emoticon"])
                                   , ""
                                   , timed.comments$processed
                                   , perl=TRUE
                                   )
}

timed.comments$emoticon.count <- as.data.frame(emoticon.count)
exit

## makes a corpus ?? PUT "." IN THE END OF EVERYCOMMENTS
timed.comments$value <- paste0(timed.comments$value, sep = "    .")

## preprocessing cleaning data
# deletes punctuations except (?!,.) and 
timed.comments$value <- gsub("[^[a-zA-Z0-9][:space:]?!,.]", "", timed.comments$value)

# xxx TODO test the analysis with or without this option
#timed.comments$value <- gsub("[[:digit:]]","", timed.comments$value )






timed.comments$value <- gsub("!+", "!", timed.comments$value)
head(timed.comments$value)

# check the structure of the timed.comments$value
head(timed.comments$value)
class(timed.comments$value)

## analysis data
# 1 get sentences
timed.comments$value <- get_sentences(timed.comments$value)
head(timed.comments$value)
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

## percentage values
 # make a plot for percentage
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

