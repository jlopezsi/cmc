library(rapport)

load("../data.gnr/music.Rdata")
names(df.music)
rapport.ls()
rapport('Descriptives', data=df.music, var='gender')
