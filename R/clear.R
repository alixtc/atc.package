#' Analog of Matlab function to clear all variables from the global environement
#' @export clear

clear <- function() {
  genv <- globalenv()
  rm(list = ls(genv), envir = genv)
}

# clear <- function() {
#   e <- environment()
#   pf <- parent.env(e)
#   rm(list = ls(pf), envir = pf)
# }
