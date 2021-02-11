#' Power Analysis through resampling and Monte Carlo style simulation for Mann-Whitney tests
#' @description Calculate power as the percentage of tests yielding the same results through bootstrap
#' @param control_data A vector of the control data to be resampled
#' @param experiment_data A vector of the experiment data to be resampled
#' @param reps The number of iteration for the bootstrap, default = 1000
#' @export atc_mw_power

atc_mw_power <- function(control_data,
                         experiment_data,
                         reps = 1000){

  results <- numeric(reps) #create vector for the results

  counter <- 1

  while (counter <= reps) {
    #resampling of the two vectors
    control <- sample(control_data,length(control_data) , replace = TRUE)
    experiment <- sample(experiment_data, length(experiment_data), replace = TRUE)

    #statistical test in a temporary variable
    tempres <- wilcox.test(control, experiment, paired = FALSE, exact = FALSE)

    results[counter] <- tempres$p.value #gets p-values
    counter <- counter + 1
  }


  #calculate power as a percentage of the number of reps with p-value < 0.05
  power <- sum(results < 0.05) / reps * 100


  return(power)
}
