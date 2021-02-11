#' Analog of Matlab function to clear all variables from the global environment
#' @export clear

clear <- function() {
  genv <- globalenv()
  rm(list = ls(genv), envir = genv)
}

