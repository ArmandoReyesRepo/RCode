

bdims_summary <- bdims %>%
  summarize(N = n(), r = cor(hgt, wgt),
            mean_hgt = mean(hgt), mean_wgt = mean(wgt),
            sd_hgt = sd(hgt), sd_wgt = sd(wgt)) %>%
  mutate(true_slope = r * sd_wgt / sd_hgt, 
         true_intercept = mean_wgt - true_slope * mean_hgt)

# Print bdims_summary

bdims_summary



