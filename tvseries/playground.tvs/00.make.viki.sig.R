library(digest)

url <- "/v4/movies.json?sort=views&app=9001&t=1356482778"
key.viki <- "orange"
sig <- hmac(key.viki, url, algo="sha1")

url.sig <- paste(url, sig, sep="&")


url <- "/v4/movies.json?sort=views&app=9001&t=1356482778"
key.viki <- ""
sig <- hmac(key.viki, url, algo="sha1")

url.sig <- paste(url, sig, sep="&")
