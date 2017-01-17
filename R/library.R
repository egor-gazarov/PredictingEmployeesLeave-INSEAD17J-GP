# installs all necessary libraries from CRAN or Github
get_libraries <- function(filenames_list) suppressPackageStartupMessages({ 
  lapply(filenames_list, function(thelibrary){    
    thelibrary.split <- strsplit(thelibrary, "/")[[1]]
    if (length(thelibrary.split) > 1) {
      # install from Github
      if (!suppressWarnings(require(thelibrary.split[2], character.only=TRUE))) {
        devtools::install_github(thelibrary, quiet=TRUE)
        library(thelibrary.split[2], character.only=TRUE)
      }
    } else {
      # install from CRAN
      if (!suppressWarnings(require(thelibrary, character.only=TRUE))) {
        install.packages(thelibrary, repos="http://cran.r-project.org/", quiet=TRUE)
        library(thelibrary, character.only=TRUE)
      }
    }
  })
})

libraries_used=c("ggplot2", "corrplot", "caret", "C50")
get_libraries(libraries_used)