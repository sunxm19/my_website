url2<-"http://quagmire.igb.illinois.edu/home/shared/licor_data/maize/raw/@47.218.198.36"


filenames<-getURL(url2, userpwd="sunxm03:Arcgis89%", ftp.use.epsv = FALSE, verbose=TRUE, dirlistonly = TRUE)


require("RCurl")
result <- getURL("http://quagmire.igb.illinois.edu/home/shared/licor_data/maize/raw/",
                 verbose=TRUE,ftp.use.epsv=TRUE, dirlistonly = TRUE)


# install.packages("httr")
library("httr")

GET(
  "http://quagmire.igb.illinois.edu/home/shared/licor_data/maize/raw/",
  authenticate("sunxm03", "Arcgis89%")
)

opts <- curlOptions(
  proxyport       = 22,
  httpproxytunnel = 1
)

url <- "ftp://quagmire.igb.illinois.edu/home/shared/licor_data/maize/raw/:22"

filenames <- getURL(url, userpwd="sunxm03:Arcgis89%", ftp.use.epsv = FALSE, dirlistonly = TRUE)
destnames <- strsplit(filenames, "\r*\n")[[1]]
destnames <- destnames[1:1000]
