library(rjson)
library(RCurl)

download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
curl <- getCurlHandle()
curlSetOpt(.opts = list(proxy = 'https://xxx:8080'), curl = curl)



get_recent_media <- function(USER_ID, ACCESS_TOKEN)
{
  #URL
  URL <- paste("https://api.instagram.com/v1/users/", USER_ID, "/media/recent/", sep="")
  
  if (!(is.null(ACCESS_TOKEN)))
  {
    URL <- paste(URL, "?access_token=", ACCESS_TOKEN, sep="")
  }
  
  TEMP <- fromJSON(getURL(URL, curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")
  
  PAG_N = 0
  
  while(length(TEMP$pagination) != 0)
  {
    PAG_URL <- TEMP$pagination[1]
    PAG_TEMP <- fromJSON(getURL(PAG_URL, curl = curl, cainfo="cacert.pem"),unexpected.escape="keep")
    
    TEMP$data <- c(TEMP$data, PAG_TEMP$data)
    TEMP$pagination <- PAG_TEMP$pagination
    
    PAG_N = PAG_N + 1
  }
  
  return(TEMP$data)
}

JSON <- get_recent_media(USER_ID = xxx, ACCESS_TOKEN="xxx")