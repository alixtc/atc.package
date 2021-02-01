#' Perform multiple MannWhitney on multiplescolumns => use Pivot_longer or nest and map
#'
atcmwcolumns <- function(df,columns,factor){
df %>%
  select(c(columns, factor)) %>%
  gather(key = variable, value = value, columns) %>%
  group_by(Strain, variable) %>%
  summarise(value = list(value)) %>%
  spread(Strain, value) %>%
  group_by(variable) %>%
    mutate(p_value = t.test(unlist(het), unlist(wt))$p.value,
           t_value = t.test(unlist(het), unlist(wt))$statistic)
}
