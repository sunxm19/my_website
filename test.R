
install.packages("remotes")
remotes::install_github("skgrange/threadr")
library(threadr)


install.packages("curl")
library(curl)

getwd()

url       <- "sftp://quagmire.igb.illinois.edu/home/shared/licor_data/maize/raw/"
userpwd   <- "sunxm03:Arcgis89%"

filenames <- getURL(url, userpwd = userpwd, ftp.use.epsv = FALSE, dirlistonly = TRUE, port = 22, connecttimeout=60)

# files_names <- unlist(strsplit(filenames, "\n"))

destnames <- filenames <-  strsplit(filenames, "\r*\n")[[1]] # destfiles = origin file names
con <-  getCurlHandle(ftp.use.epsv = FALSE)
mapply(function(x,y)
  writeBin(getBinaryURL(x, curl = con, dirlistonly = FALSE), y),
  x = filenames, y = paste("C:\\temp\\",destnames, sep = "")) #writing all zipped files in one directory





###
library(RCurl)

url<- "ftp://adress/"
filenames <- getURL(url, userpwd="USER:PASSWORD", ftp.use.epsv = FALSE, dirlistonly = TRUE) #reading filenames from ftp-server
destnames <- filenames <-  strsplit(filenames, "\r*\n")[[1]] # destfiles = origin file names
con <-  getCurlHandle(ftp.use.epsv = FALSE, userpwd="USER:PASSWORD")
mapply(function(x,y) writeBin(getBinaryURL(x, curl = con, dirlistonly = FALSE), y), x = filenames, y = paste("C:\\temp\\",destnames, sep = "")) #writing all zipped files in one directory

###


for (filename in filenames) {
  download.file(paste(url, filename, sep = ""),
                paste("./content/post/eddy_covariance/data/energy_farm/maize/", filename, sep = ""))
 }


for (filename in filenames) {
  download.file(paste(url, filename, sep = ""), paste(getwd(), "/", filename,
                                                      sep = ""))
}



destination <- "./content/post/eddy_covariance/data/energy_farm/maize/"
for(i in seq_along(url)){
  download.file(url[i], destination[i], mode="wb")
}




h <- new_handle()
handle_setopt(h, userpwd = userpwd)

lapply(files_names, function(filename){
  curl_download(paste(url, filename, sep = ""),
                destfile = filename,
                handle = h)
})

#####








destnames <- strsplit(filenames, "\n")
destnames[1]
writeLines(filenames,
           "./content/post/content/post/eddy_covariance/data/energy_farm/maize/")


x<-getURL("sftp://site.com/filename.txt", userpwd="id:passed")
fileConn<-file("output.txt")
writeLines(x, fileConn)
close(fileConn)
y<-readLines("output.txt")



data <- getURI(url = url,
               userpwd = userpwd,
               port = 22)


library(RCurl)


url<-c("sftp://data.ftp.net/incomining.data.txt")
x<-getURL(url, userpwd="<id>:<passwd>")
x<-getURL(url, userpwd="<id>:<passwd>", )




purrr::map(filenames, download_ftp_file, file_local = "./content/post/eddy_covariance/data/energy_farm/maize/data",
           sleep = 60)

download_ftp_file("sftp://quagmire.igb.illinois.edu/home/shared/licor_data/maize/raw/2020-05-20T040000_AIU-0496_maize.ghg",
                  "./content/post/eddy_covariance/data/energy_farm/maize/data", verbose = TRUE, sleep = 60)


destnames <- destnames[length(destnames)-100:length(destnames)]





install.packages(purrr)
library(purrr)

map(destnames, function(i) getURL(paste0(url, i), userpwd = userpwd))




destnames <- strsplit(filenames, "\r*\n")[[1]]
destnames <- destnames[length(destnames)-100:length(destnames)]

getHTMLLinks(filenames)


# Download a file from a server which does not need credentials
url <- "ftp://ftp.ncdc.noaa.gov/pub/data/noaa/isd-history.csv"
download_ftp_file(url, "~/Desktop/noaa_data.csv", verbose = TRUE)


C:\blog_down\my_website\content\post\eddy_covariance\data\energy_farm\maize

filen     <- "MyFile.csv"
rawdata   <- getURL(paste(url, filen, sep = ""), userpwd = userpwd, crlf =  TRUE)

myData <- lapply(destnames, function(i) getURL(paste0(url, i), userpwd = userpwd))
