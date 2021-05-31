#' Pipe-friendly function to calculate Mean, SD, and SEM through summarize
#' @description This function is particularly helpful to draw plots with SEM as the error indicator.
#' Works extremely well with ggplot() + geom_errorbar()
#' @param .data A dataframe
#' @param .var A column name to analyse
#' @export
library(tidyverse)

##  Definition of SEM function
sem <- function(x, ...){
  sd(x, ...)/sqrt(n())
}

se_summary <- function(.data, .var, ...){

  ## Calculation of intended values + naming using glue operator
  results <- .data %>%
    summarise("{{.var}}.mean" := mean({{.var}}, ...),
              "{{.var}}.sd" := sd({{.var}}, ...),
              "{{.var}}.sem" := sem({{.var}}, ...),
              n = n(),
              # "mean.{{.var}}-SEM" := mean({{.var}}) + sem({{.var}}),
              # "mean.{{.var}}-SEM" := mean({{.var}}) - sem({{.var}}),
    )
  return(results)

}
