library(digest)

url <- "/v4/movies.json?sort=views&app=9001&t=1356482778"
key.viki <- "orange"
sig <- hmac(key.viki, url, algo="sha1")

url.sig <- paste(url, sig, sep="&")


url <- "/v4/movies.json"
key.viki <- "412acbf87482c046988a966bfdee882b31055470202b9521a7102cdac32b9b10b8257decd8d0"
sig <- hmac(key.viki, url, algo="sha1")

url.sig <- paste(url, sig, sep="&")
