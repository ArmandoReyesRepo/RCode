add_line <- function (my_slope) {
  
  bdims_summary <- bdims %>%
    summarize(N = n(), r = cor(hgt, wgt),
              mean_hgt = mean(hgt), mean_wgt = mean(wgt),
              sd_hgt = sd(hgt), sd_wgt = sd(wgt)) %>%
    mutate(true_slope = r * sd_wgt / sd_hgt, 
           true_intercept = mean_wgt - true_slope * mean_hgt)
  p <- ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
    geom_point() + 
    geom_point(data = bdims_summary, 
               aes(x = mean_hgt, y = mean_wgt), 
               color = "red", size = 3)
  
  my_data <- bdims_summary %>%
    mutate(my_slope = my_slope, 
           my_intercept = mean_wgt - my_slope * mean_hgt)
  p + geom_abline(data = my_data, 
                  aes(intercept = my_intercept, slope = my_slope), color = "dodgerblue")
}

a
