# install.packages("remotes")
# remotes::install_github("stenevang/sftp")

Sys.setenv(MY_SFTP_USER = "sunxm03")
Sys.setenv(MY_SFTP_PASS = "Arcgis89%")
Sys.setenv(connecttimeout = 60)
library(sftp)
library(tidyverse)
getwd()



####
sftp_con <- sftp_connect(server = "sftp://quagmire.igb.illinois.edu/",
                         folder = "home/shared/licor_data/maize/raw/",
                         username = Sys.getenv("MY_SFTP_USER"),
                         password = Sys.getenv("MY_SFTP_PASS"),
                         protocol = "sftp://",
                         port = 22)

###
# explicit
files_list <-
  sftp_list(sftp_connection = sftp_con,
                               verbose = TRUE,
                               curlPerformVerbose = FALSE,
                               type = "file") %>%
  tail(100)

str(files_list)

### creat a for loop
for (i in 1: nrow(files_list)){
  sftp_con <- sftp_connect(server = "sftp://quagmire.igb.illinois.edu/",
                           folder = "home/shared/licor_data/maize/raw/",
                           username = Sys.getenv("MY_SFTP_USER"),
                           password = Sys.getenv("MY_SFTP_PASS"),
                           protocol = "sftp://",
                           port = 22)
#  iles_list <-
#    sftp_list(sftp_connection = sftp_con,
#              verbose = TRUE,
#              curlPerformVerbose = FALSE,
#              type = "file") %>%
#    tail(100)

  sftp_download(files_list$name[i], tofolder = "./content/post/eddy_covariance/data/energy_farm/maize/",
                verbose = TRUE)
}



###
# take a vector of file names from a dataframe
purrr::map(files_list$name, sftp_download, tofolder = "./content/post/eddy_covariance/data/energy_farm/maize/",
              verbose = TRUE)


sftp_download(files_list$name, tofolder = "./content/post/eddy_covariance/data/energy_farm/maize/",
              verbose = TRUE)

########


# minimal - take all files on the SFTP url and save in the working directory
sftp_download("*")

# take a vector of file names from a dataframe
sftp_download(files_list$name, tofolder = "content/post/eddy_covariance/data/energy_farm/maize")

# take one specific file name from a vector from a dataframe
sftp_download(file = files$name[1], tofolder = getwd() )
