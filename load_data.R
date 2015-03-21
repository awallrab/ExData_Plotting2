cwd <- getwd() # remember current working directory
setwd("~/GitHub/ExData_Plotting2")

#### Get the data and unzip
if (!file.exists("data")) { # only if not already done before
  dir.create("data")
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url = url, destfile = "data/data.zip", method = "curl")
  # write a little note when and from where the file was downloaded
  cat(paste("File data.zip downloaded", date(), "from", url), file = "data/downloaded.txt")
  unzip(zipfile = "data/data.zip")
}

setwd(cwd)
