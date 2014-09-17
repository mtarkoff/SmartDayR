setwd("c:/users/mtarkoff/documents/r")

library(rjson)
library(RCurl)

#need
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
curl <- getCurlHandle()
curlSetOpt(.opts = list(proxy = 'https://proxy.pa.gov:8080'), curl = curl)

url <- "https://api.instagram.com/v1/users/188084472/media/recent/?access_token=198648296.c5085a6.d1024e30041e4e128ee386124062768c&count=50"

feed1 <- fromJSON(getURL(url, curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag1 <- fromJSON(getURL(url, curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed2 <- fromJSON(getURL(pag1[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag2 <- fromJSON(getURL(pag1[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed3 <- fromJSON(getURL(pag2[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag3 <- fromJSON(getURL(pag2[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed4 <- fromJSON(getURL(pag3[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag4 <- fromJSON(getURL(pag3[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed5 <- fromJSON(getURL(pag4[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag5 <- fromJSON(getURL(pag4[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed6 <- fromJSON(getURL(pag5[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag6 <- fromJSON(getURL(pag5[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed7 <- fromJSON(getURL(pag6[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag7 <- fromJSON(getURL(pag6[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed8 <- fromJSON(getURL(pag7[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data
pag8 <- fromJSON(getURL(pag7[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$pagination

feed9 <- fromJSON(getURL(pag8[1], curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")$data


sapply(feed1, "[[", i=9)


#number of likes per picture
like1<-lapply(lapply(feed1, "[[", i=9), "[[", i=1)
like2<-lapply(lapply(feed2, "[[", i=9), "[[", i=1)
like3<-lapply(lapply(feed3, "[[", i=9), "[[", i=1)
like4<-lapply(lapply(feed4, "[[", i=9), "[[", i=1)
like5<-lapply(lapply(feed5, "[[", i=9), "[[", i=1)
like6<-lapply(lapply(feed6, "[[", i=9), "[[", i=1)
like7<-lapply(lapply(feed7, "[[", i=9), "[[", i=1)
like8<-lapply(lapply(feed8, "[[", i=9), "[[", i=1)
like9<-lapply(lapply(feed9, "[[", i=9), "[[", i=1)

#filters per picture
filter1<-lapply(lapply(feed1, "[[", i=6), "[[", i=1)
filter2<-lapply(lapply(feed2, "[[", i=6), "[[", i=1)
filter3<-lapply(lapply(feed3, "[[", i=6), "[[", i=1)
filter4<-lapply(lapply(feed4, "[[", i=6), "[[", i=1)
filter5<-lapply(lapply(feed5, "[[", i=6), "[[", i=1)
filter6<-lapply(lapply(feed6, "[[", i=6), "[[", i=1)
filter7<-lapply(lapply(feed7, "[[", i=6), "[[", i=1)
filter8<-lapply(lapply(feed8, "[[", i=6), "[[", i=1)
filter9<-lapply(lapply(feed9, "[[", i=6), "[[", i=1)

#date of picture (unix)
date1<-lapply(lapply(feed1, "[[", i=7), "[[", i=1)
date2<-lapply(lapply(feed2, "[[", i=7), "[[", i=1)
date3<-lapply(lapply(feed3, "[[", i=7), "[[", i=1)
date4<-lapply(lapply(feed4, "[[", i=7), "[[", i=1)
date5<-lapply(lapply(feed5, "[[", i=7), "[[", i=1)
date6<-lapply(lapply(feed6, "[[", i=7), "[[", i=1)
date7<-lapply(lapply(feed7, "[[", i=7), "[[", i=1)
date8<-lapply(lapply(feed8, "[[", i=7), "[[", i=1)
date9<-lapply(lapply(feed9, "[[", i=7), "[[", i=1)

#caption on picuture
tag1<-lapply(lapply(feed1, "[[", i=12), "[[", i=2)
tag2<-lapply(lapply(feed2, "[[", i=12), "[[", i=2)
tag3<-lapply(lapply(feed3, "[[", i=12), "[[", i=2)
tag4<-lapply(lapply(feed4, "[[", i=12), "[[", i=2)
tag5<-lapply(lapply(feed5, "[[", i=12), "[[", i=2)
tag6<-lapply(lapply(feed6, "[[", i=12), "[[", i=2)
tag7<-lapply(lapply(feed7, "[[", i=12), "[[", i=2)
tag8<-lapply(lapply(feed8, "[[", i=12), "[[", i=2)
tag9<-lapply(lapply(feed9, "[[", i=12), "[[", i=2)

tag1[sapply(tag1, is.null)] <- NA
tag2[sapply(tag2, is.null)] <- NA
tag3[sapply(tag3, is.null)] <- NA
tag4[sapply(tag4, is.null)] <- NA
tag5[sapply(tag5, is.null)] <- NA
tag6[sapply(tag6, is.null)] <- NA
tag7[sapply(tag7, is.null)] <- NA
tag8[sapply(tag8, is.null)] <- NA
tag9[sapply(tag9, is.null)] <- NA
tag<- unlist(list(tag1, tag2, tag3, tag4, tag5, tag6, tag7, tag8, tag9))
tag <- iconv(tag, "latin1", "ASCII", sub="")


#latitude
lat1<-lapply(lapply(feed1, "[[", i=4), "[[", i="latitude")
lat2<-lapply(lapply(feed2, "[[", i=4), "[[", i="latitude")
lat3<-lapply(lapply(feed3, "[[", i=4), "[[", i="latitude")
lat4<-lapply(lapply(feed4, "[[", i=4), "[[", i="latitude")
lat5<-lapply(lapply(feed5, "[[", i=4), "[[", i="latitude")
lat6<-lapply(lapply(feed6, "[[", i=4), "[[", i="latitude")
lat7<-lapply(lapply(feed7, "[[", i=4), "[[", i="latitude")
lat8<-lapply(lapply(feed8, "[[", i=4), "[[", i="latitude")
lat9<-lapply(lapply(feed9, "[[", i=4), "[[", i="latitude")

lat1[sapply(lat1, is.null)] <- NA
lat2[sapply(lat2, is.null)] <- NA
lat3[sapply(lat3, is.null)] <- NA
lat4[sapply(lat4, is.null)] <- NA
lat5[sapply(lat5, is.null)] <- NA
lat6[sapply(lat6, is.null)] <- NA
lat7[sapply(lat7, is.null)] <- NA
lat8[sapply(lat8, is.null)] <- NA
lat9[sapply(lat9, is.null)] <- NA

#longitude
long1<-lapply(lapply(feed1, "[[", i=4), "[[", i="longitude")
long2<-lapply(lapply(feed2, "[[", i=4), "[[", i="longitude")
long3<-lapply(lapply(feed3, "[[", i=4), "[[", i="longitude")
long4<-lapply(lapply(feed4, "[[", i=4), "[[", i="longitude")
long5<-lapply(lapply(feed5, "[[", i=4), "[[", i="longitude")
long6<-lapply(lapply(feed6, "[[", i=4), "[[", i="longitude")
long7<-lapply(lapply(feed7, "[[", i=4), "[[", i="longitude")
long8<-lapply(lapply(feed8, "[[", i=4), "[[", i="longitude")
long9<-lapply(lapply(feed9, "[[", i=4), "[[", i="longitude")

long1[sapply(long1, is.null)] <- NA
long2[sapply(long2, is.null)] <- NA
long3[sapply(long3, is.null)] <- NA
long4[sapply(long4, is.null)] <- NA
long5[sapply(long5, is.null)] <- NA
long6[sapply(long6, is.null)] <- NA
long7[sapply(long7, is.null)] <- NA
long8[sapply(long8, is.null)] <- NA
long9[sapply(long9, is.null)] <- NA

#location name
loc1<-lapply(lapply(feed1, "[[", i=4), "[[", i="name")
loc2<-lapply(lapply(feed2, "[[", i=4), "[[", i="name")
loc3<-lapply(lapply(feed3, "[[", i=4), "[[", i="name")
loc4<-lapply(lapply(feed4, "[[", i=4), "[[", i="name")
loc5<-lapply(lapply(feed5, "[[", i=4), "[[", i="name")
loc6<-lapply(lapply(feed6, "[[", i=4), "[[", i="name")
loc7<-lapply(lapply(feed7, "[[", i=4), "[[", i="name")
loc8<-lapply(lapply(feed8, "[[", i=4), "[[", i="name")
loc9<-lapply(lapply(feed9, "[[", i=4), "[[", i="name")

loc1[sapply(loc1, is.null)] <- NA
loc2[sapply(loc2, is.null)] <- NA
loc3[sapply(loc3, is.null)] <- NA
loc4[sapply(loc4, is.null)] <- NA
loc5[sapply(loc5, is.null)] <- NA
loc6[sapply(loc6, is.null)] <- NA
loc7[sapply(loc7, is.null)] <- NA
loc8[sapply(loc8, is.null)] <- NA
loc9[sapply(loc9, is.null)] <- NA

#picture id
pid1<-lapply(lapply(feed1, "[[", i=14), "[[", i=1)
pid2<-lapply(lapply(feed2, "[[", i=14), "[[", i=1)
pid3<-lapply(lapply(feed3, "[[", i=14), "[[", i=1)
pid4<-lapply(lapply(feed4, "[[", i=14), "[[", i=1)
pid5<-lapply(lapply(feed5, "[[", i=14), "[[", i=1)
pid6<-lapply(lapply(feed6, "[[", i=14), "[[", i=1)
pid7<-lapply(lapply(feed7, "[[", i=14), "[[", i=1)
pid8<-lapply(lapply(feed8, "[[", i=14), "[[", i=1)
pid9<-lapply(lapply(feed9, "[[", i=14), "[[", i=1)

#media type
mtyp1<-lapply(lapply(feed1, "[[", i=3), "[[", i=1)
mtyp2<-lapply(lapply(feed2, "[[", i=3), "[[", i=1)
mtyp3<-lapply(lapply(feed3, "[[", i=3), "[[", i=1)
mtyp4<-lapply(lapply(feed4, "[[", i=3), "[[", i=1)
mtyp5<-lapply(lapply(feed5, "[[", i=3), "[[", i=1)
mtyp6<-lapply(lapply(feed6, "[[", i=3), "[[", i=1)
mtyp7<-lapply(lapply(feed7, "[[", i=3), "[[", i=1)
mtyp8<-lapply(lapply(feed8, "[[", i=3), "[[", i=1)
mtyp9<-lapply(lapply(feed9, "[[", i=3), "[[", i=1)

#number of comments
com1<-lapply(lapply(feed1, "[[", i=5), "[[", i=1)
com2<-lapply(lapply(feed2, "[[", i=5), "[[", i=1)
com3<-lapply(lapply(feed3, "[[", i=5), "[[", i=1)
com4<-lapply(lapply(feed4, "[[", i=5), "[[", i=1)
com5<-lapply(lapply(feed5, "[[", i=5), "[[", i=1)
com6<-lapply(lapply(feed6, "[[", i=5), "[[", i=1)
com7<-lapply(lapply(feed7, "[[", i=5), "[[", i=1)
com8<-lapply(lapply(feed8, "[[", i=5), "[[", i=1)
com9<-lapply(lapply(feed9, "[[", i=5), "[[", i=1)

#number of people tagged in photo
peo1=lapply(lapply(feed1, "[[", i=11), "length")
peo2=lapply(lapply(feed2, "[[", i=11), "length")
peo3=lapply(lapply(feed3, "[[", i=11), "length")
peo4=lapply(lapply(feed4, "[[", i=11), "length")
peo5=lapply(lapply(feed5, "[[", i=11), "length")
peo6=lapply(lapply(feed6, "[[", i=11), "length")
peo7=lapply(lapply(feed7, "[[", i=11), "length")
peo8=lapply(lapply(feed8, "[[", i=11), "length")
peo9=lapply(lapply(feed9, "[[", i=11), "length")

#link
link1<-lapply(lapply(feed1, "[[", i=8), "[[", i=1)
link2<-lapply(lapply(feed2, "[[", i=8), "[[", i=1)
link3<-lapply(lapply(feed3, "[[", i=8), "[[", i=1)
link4<-lapply(lapply(feed4, "[[", i=8), "[[", i=1)
link5<-lapply(lapply(feed5, "[[", i=8), "[[", i=1)
link6<-lapply(lapply(feed6, "[[", i=8), "[[", i=1)
link7<-lapply(lapply(feed7, "[[", i=8), "[[", i=1)
link8<-lapply(lapply(feed8, "[[", i=8), "[[", i=1)
link9<-lapply(lapply(feed9, "[[", i=8), "[[", i=1)

Brig<-data.frame(likes=
                   unlist(list(like1, like2, like3, like4, like5, like6, like7, like8, like9)),
                 filters=
                   unlist(list(filter1, filter2, filter3, filter4, filter5, filter6, filter7, filter8, filter9)),
                 days=
                   unlist(list(date1, date2, date3, date4, date5, date6, date7, date8, date9)),
                 captions=tag,
                 latitude=
                   unlist(list(lat1, lat2, lat3, lat4, lat5, lat6, lat7, lat8, lat9)),
                 longitude=
                   unlist(list(long1, long2, long3, long4, long5, long6, long7, long8, long9)),
                 location=
                   unlist(list(loc1, loc2, loc3, loc4, loc5, loc6, loc7, loc8, loc9)),
                 picID=
                   unlist(list(pid1, pid2, pid3, pid4, pid5, pid6, pid7, pid8, pid9)),
                 MediaType=
                   unlist(list(mtyp1, mtyp2, mtyp3, mtyp4, mtyp5, mtyp6, mtyp7, mtyp8, mtyp9)),
                 Comments=
                   unlist(list(com1, com2, com3, com4, com5, com6, com7, com8, com9)),
                 PhotoTag=
                   unlist(list(peo1, peo2, peo3, peo4, peo5, peo6, peo7, peo8, peo9)),
                 URL=
                   unlist(list(link1, link2, link3, link4, link5, link6, link7, link8, link9))
                 )




