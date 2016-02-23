## Analysis Sentiment
install.packages("syuzhet")
library(syuzhet)

## Download txt
my_example_text <- "I begin this story with a neutral statement.
  Basically this is a very silly test.
You are testing the Syuzhet package using short, inane sentences.
I am actually very happy today.
I have finally finished writing this package.
Tomorrow I will be very sad.
I won't have anything left to do.
I might get angry and decide to do something horrible.
I might destroy the entire package and start from scratch.
Then again, I might find it satisfying to have completed my first R package.
Honestly this use of the Fourier transformation is really quite elegant.
You might even say it's beautiful!"
s_v <- get_sentences(my_example_text)
# data frame
class(s_v)
str(s_v)
head(s_v)

## get sentiment scors depending on different methods
# 1 bing
sentiment_vector <- get_sentiment(s_v, method="bing")
sentiment_vector
# 2 afinn
afinn_vector <- get_sentiment(s_v, method="afinn")
afinn_vector
# 3 nrc
nrc_vector <- get_sentiment(s_v, method="nrc")
nrc_vector

## sum of sentiment scores
sum(sentiment_vector)
## average of sentiment scores
mean(sentiment_vector)
## summary of sentiment scores
summary(sentiment_vector)

## make a plot of sentiment scores
plot(
sentiment_vector,
type="l",
main="Example Plot Trajectory",
xlab = "Narrative Time",
ylab= "Emotional Valence"
)

## make a
poa_sent <- get_sentiment(poa_v, method="bing")
plot(
poa_sent,
type="h",
main="Example Plot Trajectory",
xlab = "Narrative Time",
ylab= "Emotional Valence"
)

## percentage values
percent_vals <- get_percentage_values(poa_sent)
plot(
percent_vals,
type="l",
main="Joyce's Portrait Using Percentage-Based Means",
xlab = "Narrative Time",
ylab= "Emotional Valence",
col="red"
)

## transformed values
ft_values <- get_transformed_values(
poa_sent,
low_pass_size = 3,
x_reverse_len = 100,
scale_vals = TRUE,
scale_range = FALSE
)
plot(
ft_values,
type ="h",
main ="Joyce's Portrait using Transformed Values",
xlab = "Narrative Time",
ylab = "Emotional Valence",
col = "red"
)

## nrc sentiment analysis
nrc_data <- get_nrc_sentiment(s_v)
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
