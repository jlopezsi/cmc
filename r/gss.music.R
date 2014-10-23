library(prefmod)
data(music)
head(music)
# keep only the 17 genre used
# in the AMJ Paper (see post)
prefer<-music[,c(1:11,13:18)]
head(prefer)
# calculate number of missing values for each
# respondent and keep only those with no more
# than 6 missing values
miss<-apply(prefer,1,function(x) sum(is.na(x)))
prefer<-prefer[miss<7,]

# run frequency tables for all the variables
apply(prefer,2,function(x) table(x,useNA="always"))
# recode missing to the middle of the 5-point scale
prefer[is.na(prefer)]<-3
# reverse the scale so that larger values are
# associated with more liking and zero is
# the lowest value
prefer<-5-prefer

# longer names are easier to interpret
names(prefer)<-c("BigBand",
                 "Bluegrass",
                 "Country",
                 "Blues",
                 "Musicals",
                 "Classical",
                 "Folk",
                 "Gospel",
                 "Jazz",
                 "Latin",
                 "MoodEasy",
                 "Opera",
                 "Rap",
                 "Reggae",
                 "ConRock",
                 "OldRock",
                 "HvyMetal")

library(NMF)
fit<-nmf(prefer, 5, "lee", nrun=30)
coefmap(fit, tracks=NA)
basismap(fit, tracks=NA)

# recode bottom three boxes to zero
# and rerun NMF
prefer2<-prefer-2
prefer2[prefer2<0]<-0
# need to remove respondents with all zeros
total<-apply(prefer2,1,sum)
table(total)
prefer2<-prefer2[total>0,]

fit<-nmf(prefer2, 5, "lee", nrun=30)
coefmap(fit, tracks=NA)
basismap(fit, tracks=NA)