#' Analog of Matlab function to keep only specifyied variables in the global environment
#' @export clearvars_except

clearvars_except <- function(...){
  # Get variables as typed in the function call
  variables <- as.list(sys.call())
  variables <- paste(variables[-1])

  globenv <- globalenv()

  if ( length(variables) == 0 ){
    warning("Select variables to remove from global environment")
  }else{

    # Keep only the typed variables
    rm(list = setdiff(ls(globenv), variables),
       envir = globenv)
  }
}
