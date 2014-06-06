#' @import rJava
require(rJava)
.jpackage(name = 'JSON2XML', jars = "*")

.onLoad <- function(libname, pkgname) {
  library(rJava)
  .jpackage(name = pkgname, jars = "*")
}

.onAttach <- function(libname, pkgname) {
  library(rJava)
  .jpackage(name = pkgname, jars = "*")
}