install_load <- function (package1, ...) {
  # convert arguments to vector
  packages <- c(package1, ...)
  # start loop to determine if each package is installed
  for (package in packages) {
    # if package is installed locally, load
    if (package %in% rownames(installed.packages()))
      do.call(library, list(package))
    # if package is not installed locally, download and then load
    else {
      install.packages(package, repos =
                         c("https://cloud.r-project.org", "http://owi.usgs.gov/R/"),
                       dependencies = NA, type = getOption("pkgType"))
      do.call(library, list(package))
    }
  }
}