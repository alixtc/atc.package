df <- tibble(x = 1:12, y = rep(c(-1,1), 6))
sum_x <- df %>% se_summary(x)

expect_equal(sum_x$x.mean, mean(df$x))
expect_equal(sum_x$x.sd, sd(df$x))

grouped <- df %>% group_by(y) %>% se_summary(x)
pos_df <- df[df$y > 0, ]
neg_df <- df[df$y < 0, ]

expect_equal(grouped$x.mean, c(mean(neg_df$x), mean(pos_df$x)))
expect_equal(grouped$x.sd, c(sd(neg_df$x), sd(pos_df$x)))
expect_equal(grouped$x.sem, c(sd(neg_df$x)/sqrt(6), sd(pos_df$x)/sqrt(6)))
