assign('df',tibble(x = 1:12, y = rep(c(-1,1), 6)), envir = globalenv())
assign('pos_df', df[df$y > 0, ], envir = globalenv() )
assign('neg_df', df[df$y < 0, ], envir = globalenv() )

clearvars_except(pos_df)

expect_equal(ls(envir = globalenv()), 'pos_df')

clear()

expect_equal(ls(envir = globalenv()), character(0))
