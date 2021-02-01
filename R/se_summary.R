#' Dplyr-friendly function to calculate Mean, SD, and SEM through summarize
#'@export
se_summary <- function(.data, .var){


  ##  Definition of SEM function
  sem <- function(x){
    sd(x)/sqrt(n())
  }

  ## Calculation of intended values + naming using glue operator
  results <- .data %>%
    summarise("{{.var}}.mean" := mean({{.var}}),
              "{{.var}}.sd" := sd({{.var}}),
              "{{.var}}.sem" := sem({{.var}}),
              n = n(),
              # "mean.{{.var}}-SEM" := mean({{.var}}) + sem({{.var}}),
              # "mean.{{.var}}-SEM" := mean({{.var}}) - sem({{.var}}),
    )
  return(results)

}
